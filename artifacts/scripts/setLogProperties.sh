#!/bin/bash
# logging settings in RDF_Map.prop; each key only changes when its env var is set
RDF=/opt/semosshome/RDF_Map.prop

# escape sed replacement specials so any value passes through
esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

# true sends the Python process's stdout/stderr to the SEMOSS log instead of its console file
if [[ -n "${PY_LOG_CAPTURE_ENABLED}" ]];
then
  echo "Setting PY_LOG_CAPTURE_ENABLED"
  sed -i "s@^PY_LOG_CAPTURE_ENABLED.*@PY_LOG_CAPTURE_ENABLED\t$(esc "$PY_LOG_CAPTURE_ENABLED")@" "$RDF"
fi

# a secret: set it from semoss-secrets, as hex (RDF_Map.prop reads a backslash as an escape)
if [[ -n "${LOG_HASH_SALT}" ]];
then
  echo "Setting LOG_HASH_SALT"
  sed -i "s@^LOG_HASH_SALT.*@LOG_HASH_SALT\t$(esc "$LOG_HASH_SALT")@" "$RDF"
fi
