#!/usr/bin/env bash
#
# build_chroot_template.sh
# ------------------------------------------------------------------
# Bake the shared chroot template at IMAGE BUILD TIME so the running
# container never pays for it (no startup CPU contention, no JVM fork).
#
# This is a faithful shell port of prerna.util.ChrootTemplate.build():
# same binary allowlist, same git-core/templates/cert handling. After it
# runs, it writes the ".ready" marker so the Java side short-circuits to
# "already present" and awaitReady() returns instantly.
#
# Usage (in Dockerfile):   RUN /tmp/build_chroot_template.sh /opt/chroot [mode]
#   Arg 1: CHROOT_DIR  (default /opt/chroot). Template is <CHROOT_DIR>/.template.
#   Arg 2: mode        symlink (default) | copy
#
# MODES
#   symlink : template entries are SYMLINKS to the real binaries/libs/dirs that
#             already exist in the image. Template shrinks from ~21 MB to ~KB.
#             Curation is preserved because only the allowlisted binaries are
#             linked (bin/ and usr/bin/ are real dirs of individual symlinks, NOT
#             a whole-dir link of /bin). Per-user chroots then symlink to the
#             template, giving user -> template -> real chains that fakechroot
#             resolves via the kernel.
#   copy    : template entries are real byte copies (the original, proven path).
# ------------------------------------------------------------------
# NOTE: deliberately NOT using `set -e`/`pipefail`. Many steps are optional
# (a binary or cert path may be absent on a given base image) and `ldd | grep`
# legitimately matches nothing for static binaries - under -e/pipefail those
# would abort the build. Instead we tolerate per-item misses and do one hard
# sanity check at the end (bash + git + interpreter must resolve), failing
# loudly only if the core template is actually broken.
set -u

CHROOT_DIR="${1:-/opt/chroot}"
MODE="${2:-symlink}"
TEMPLATE="$CHROOT_DIR/.template"
READY_MARKER="$TEMPLATE/.ready"

case "$MODE" in
  symlink|copy) ;;
  *) echo "[build_chroot_template] ERROR: mode must be 'symlink' or 'copy', got '$MODE'" >&2; exit 2 ;;
esac

echo "[build_chroot_template] building template at $TEMPLATE (mode=$MODE)"

if [ -f "$READY_MARKER" ]; then
  echo "[build_chroot_template] already present, skipping"
  exit 0
fi
rm -rf "$TEMPLATE"
mkdir -p "$TEMPLATE"

# ---- place a single FILE into the template (symlink to real, or copy bytes) ----
place_file() {
  local src="$1"
  [ -e "$src" ] || return 0
  mkdir -p "$TEMPLATE$(dirname "$src")"
  if [ "$MODE" = symlink ]; then
    ln -sfn "$src" "$TEMPLATE$src"
  else
    cp -a "$src" "$TEMPLATE$src"
    chmod +x "$TEMPLATE$src" 2>/dev/null || true
  fi
}

# ---- place a whole DIRECTORY (symlink the dir, or recursively copy it) ----
place_dir() {
  local src="$1"
  [ -d "$src" ] || return 0
  mkdir -p "$TEMPLATE$(dirname "$src")"
  if [ "$MODE" = symlink ]; then
    ln -sfn "$src" "$TEMPLATE$src"
  else
    cp -a "$src" "$TEMPLATE$src"
  fi
}

# ---- place just the shared libraries a binary needs (NOT the binary itself) ----
place_libs_only() {
  local bin="$1"
  [ -e "$bin" ] || return 0
  ldd "$bin" 2>/dev/null | grep -oE '/[^ ]+\.so[^ ]*' | while read -r lib; do
    [ -e "$lib" ] || continue
    place_file "$lib"
  done
}

# ---- place a binary + every shared library it needs (via ldd) ----
place_with_libs() {
  local bin="$1"
  [ -e "$bin" ] || { echo "  skip (missing): $bin"; return 0; }
  place_file "$bin"
  place_libs_only "$bin"
}

# ===== Bash tier (ChrootTemplate.setupBash) =====
echo "[build_chroot_template] bash tier"
mkdir -p "$TEMPLATE/bin" "$TEMPLATE/lib" "$TEMPLATE/lib64"
for b in /bin/bash /bin/sh /usr/bin/coreutils /bin/ls /bin/echo /bin/mkdir \
         /bin/touch /bin/cp /bin/mv /bin/rm /bin/cat /bin/pwd /usr/bin/whoami /usr/bin/id; do
  place_with_libs "$b"
done
# ELF interpreter (ldd lists it without '=>')
INTERP=$(ldd /bin/bash 2>/dev/null | grep -oE '/lib[^ ]*ld-linux[^ ]*' | head -1 || true)
if [ -n "${INTERP:-}" ]; then place_file "$INTERP"; fi

# ===== Git tier (ChrootTemplate.setupGit) =====
echo "[build_chroot_template] git tier"
for b in /usr/bin/git /usr/bin/curl /usr/bin/ssh /bin/tar /bin/gzip /usr/bin/openssl /usr/bin/wget; do
  place_with_libs "$b"
done

# git-core helpers: RHEL first, then Ubuntu, then ask git. The whole dir is placed
# (symlinked or copied); do NOT place git-remote-https individually afterwards or
# in symlink mode we'd write into the real git-core dir through the dir symlink.
if [ -d /usr/libexec/git-core ]; then
  place_dir /usr/libexec/git-core
elif [ -d /usr/lib/git-core ]; then
  place_dir /usr/lib/git-core
else
  GC=$(git --exec-path 2>/dev/null || true); [ -n "${GC:-}" ] && place_dir "$GC"
fi
# the network helper's libs (libcurl/libssl) still need to be present standalone
for h in /usr/libexec/git-core/git-remote-https /usr/lib/git-core/git-remote-https; do
  [ -e "$h" ] && place_libs_only "$h"
done

# git-specific libs (RHEL lib64, else Ubuntu multiarch)
RHEL_LIBS=(/usr/lib64/libcurl.so.4 /usr/lib64/libssl.so.3 /usr/lib64/libcrypto.so.3 /usr/lib64/libz.so.1 /usr/lib64/libgssapi_krb5.so.2)
UBU_LIBS=(/usr/lib/x86_64-linux-gnu/libcurl.so.4 /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libz.so.1)
found_rhel=0
for lib in "${RHEL_LIBS[@]}"; do
  if [ -e "$lib" ]; then place_file "$lib"; found_rhel=1; fi
done
if [ "$found_rhel" -eq 0 ]; then
  for lib in "${UBU_LIBS[@]}"; do
    [ -e "$lib" ] && place_file "$lib"
  done
fi

# git templates
for t in /usr/share/git-core/templates /usr/local/share/git-core/templates; do
  if [ -d "$t" ]; then place_dir "$t"; break; fi
done

# CA certs: RHEL /etc/pki, else Ubuntu /etc/ssl. These directories are placed as
# a whole (symlinked or copied); ChrootTemplate.linkInto links them into the
# per-user (real) /etc.
if [ -d /etc/pki ]; then
  for d in /etc/pki/tls/certs /etc/pki/ca-trust/extracted /etc/pki/tls; do place_dir "$d"; done
else
  place_dir /etc/ssl/certs
  place_dir /usr/share/ca-certificates
fi

# ---- hard sanity check: the core template must resolve, else fail the build ----
# (-e follows symlinks, so a dangling link is correctly treated as missing)
missing=0
for required in "$TEMPLATE/bin/bash" "$TEMPLATE/usr/bin/git"; do
  if [ ! -e "$required" ]; then
    echo "[build_chroot_template] ERROR: required component does not resolve: $required" >&2
    missing=1
  fi
done
if [ -n "${INTERP:-}" ] && [ ! -e "$TEMPLATE$INTERP" ]; then
  echo "[build_chroot_template] ERROR: ELF interpreter does not resolve: $TEMPLATE$INTERP" >&2
  missing=1
fi
if [ "$missing" -ne 0 ]; then
  echo "[build_chroot_template] aborting: template is incomplete, NOT writing .ready" >&2
  exit 1
fi

# Completion marker (written LAST, exactly like ChrootTemplate)
touch "$READY_MARKER"

echo "[build_chroot_template] done. size: $(du -sh "$TEMPLATE" | cut -f1) (mode=$MODE)"