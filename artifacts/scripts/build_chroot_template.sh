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
# Usage (in Dockerfile):   RUN /tmp/build_chroot_template.sh /opt/chroot
# Arg 1: CHROOT_DIR (the same value the app reads from CHROOT_DIR). The
#        template is created at <CHROOT_DIR>/.template.
# ------------------------------------------------------------------
# NOTE: deliberately NOT using `set -e`/`pipefail`. Many steps are optional
# (a binary or cert path may be absent on a given base image) and `ldd | grep`
# legitimately matches nothing for static binaries - under -e/pipefail those
# would abort the build. Instead we tolerate per-item misses and do one hard
# sanity check at the end (bash + git + interpreter must exist), failing loudly
# only if the core template is actually broken.
set -u

CHROOT_DIR="${1:-/opt/chroot}"
TEMPLATE="$CHROOT_DIR/.template"
READY_MARKER="$TEMPLATE/.ready"

echo "[build_chroot_template] building template at $TEMPLATE"

if [ -f "$READY_MARKER" ]; then
  echo "[build_chroot_template] already present, skipping"
  exit 0
fi
rm -rf "$TEMPLATE"
mkdir -p "$TEMPLATE"

# ---- copy a binary + every shared library it needs (via ldd) ----
copy_with_libs() {
  local bin="$1"
  [ -e "$bin" ] || { echo "  skip (missing): $bin"; return 0; }
  mkdir -p "$TEMPLATE$(dirname "$bin")"
  cp -a "$bin" "$TEMPLATE$bin"
  chmod +x "$TEMPLATE$bin" 2>/dev/null || true
  ldd "$bin" 2>/dev/null | grep -oE '/[^ ]+\.so[^ ]*' | while read -r lib; do
    [ -e "$lib" ] || continue
    mkdir -p "$TEMPLATE$(dirname "$lib")"
    [ -e "$TEMPLATE$lib" ] || cp -a "$lib" "$TEMPLATE$lib"
  done
}

copy_dir() {  # copy_dir <src> ; mirrors into the template at the same path
  local src="$1"
  [ -d "$src" ] || return 0
  mkdir -p "$TEMPLATE$(dirname "$src")"
  cp -a "$src" "$TEMPLATE$src"
}

# ===== Bash tier (ChrootTemplate.setupBash) =====
echo "[build_chroot_template] bash tier"
mkdir -p "$TEMPLATE/bin" "$TEMPLATE/lib" "$TEMPLATE/lib64"
for b in /bin/bash /bin/sh /usr/bin/coreutils /bin/ls /bin/echo /bin/mkdir \
         /bin/touch /bin/cp /bin/mv /bin/rm /bin/cat /bin/pwd /usr/bin/whoami /usr/bin/id; do
  copy_with_libs "$b"
done
# ELF interpreter (ldd lists it without '=>')
INTERP=$(ldd /bin/bash 2>/dev/null | grep -oE '/lib[^ ]*ld-linux[^ ]*' | head -1 || true)
if [ -n "${INTERP:-}" ]; then mkdir -p "$TEMPLATE$(dirname "$INTERP")"; cp -a "$INTERP" "$TEMPLATE$INTERP" 2>/dev/null || true; fi

# ===== Git tier (ChrootTemplate.setupGit) =====
echo "[build_chroot_template] git tier"
for b in /usr/bin/git /usr/bin/curl /usr/bin/ssh /bin/tar /bin/gzip /usr/bin/openssl /usr/bin/wget; do
  copy_with_libs "$b"
done

# git-core helpers: RHEL first, then Ubuntu, then ask git
if [ -d /usr/libexec/git-core ]; then
  copy_dir /usr/libexec/git-core
elif [ -d /usr/lib/git-core ]; then
  copy_dir /usr/lib/git-core
else
  GC=$(git --exec-path 2>/dev/null || true); [ -n "$GC" ] && copy_dir "$GC"
fi
# also pull libs for the network helper explicitly
for h in /usr/libexec/git-core/git-remote-https /usr/lib/git-core/git-remote-https; do
  [ -e "$h" ] && copy_with_libs "$h"
done

# git-specific libs (RHEL lib64, else Ubuntu multiarch)
RHEL_LIBS=(/usr/lib64/libcurl.so.4 /usr/lib64/libssl.so.3 /usr/lib64/libcrypto.so.3 /usr/lib64/libz.so.1 /usr/lib64/libgssapi_krb5.so.2)
UBU_LIBS=(/usr/lib/x86_64-linux-gnu/libcurl.so.4 /usr/lib/x86_64-linux-gnu/libssl.so.3 /usr/lib/x86_64-linux-gnu/libcrypto.so.3 /usr/lib/x86_64-linux-gnu/libz.so.1)
found_rhel=0
for lib in "${RHEL_LIBS[@]}"; do
  if [ -e "$lib" ]; then mkdir -p "$TEMPLATE$(dirname "$lib")"; [ -e "$TEMPLATE$lib" ] || cp -a "$lib" "$TEMPLATE$lib"; found_rhel=1; fi
done
if [ "$found_rhel" -eq 0 ]; then
  for lib in "${UBU_LIBS[@]}"; do
    [ -e "$lib" ] && { mkdir -p "$TEMPLATE$(dirname "$lib")"; [ -e "$TEMPLATE$lib" ] || cp -a "$lib" "$TEMPLATE$lib"; }
  done
fi

# git templates
for t in /usr/share/git-core/templates /usr/local/share/git-core/templates; do
  if [ -d "$t" ]; then copy_dir "$t"; break; fi
done

# CA certs: RHEL /etc/pki, else Ubuntu /etc/ssl
if [ -d /etc/pki ]; then
  for f in /etc/pki/tls/certs/ca-bundle.crt /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem /etc/pki/tls/cert.pem; do
    [ -e "$f" ] && { mkdir -p "$TEMPLATE$(dirname "$f")"; cp -a "$f" "$TEMPLATE$f"; }
  done
  for d in /etc/pki/tls/certs /etc/pki/ca-trust/extracted /etc/pki/tls; do copy_dir "$d"; done
else
  [ -e /etc/ssl/certs/ca-certificates.crt ] && { mkdir -p "$TEMPLATE/etc/ssl/certs"; cp -a /etc/ssl/certs/ca-certificates.crt "$TEMPLATE/etc/ssl/certs/"; }
  copy_dir /etc/ssl/certs
  copy_dir /usr/share/ca-certificates
fi

# ---- hard sanity check: the core template must be usable, else fail the build ----
missing=0
for required in "$TEMPLATE/bin/bash" "$TEMPLATE/usr/bin/git"; do
  if [ ! -e "$required" ]; then
    echo "[build_chroot_template] ERROR: required component missing from template: $required" >&2
    missing=1
  fi
done
# the ELF interpreter must be present or nothing in the chroot can exec
if [ -n "${INTERP:-}" ] && [ ! -e "$TEMPLATE$INTERP" ]; then
  echo "[build_chroot_template] ERROR: ELF interpreter missing from template: $TEMPLATE$INTERP" >&2
  missing=1
fi
if [ "$missing" -ne 0 ]; then
  echo "[build_chroot_template] aborting: template is incomplete, NOT writing .ready" >&2
  exit 1
fi

# Completion marker (written LAST, exactly like ChrootTemplate)
touch "$READY_MARKER"

echo "[build_chroot_template] done. size: $(du -sh "$TEMPLATE" | cut -f1)"
