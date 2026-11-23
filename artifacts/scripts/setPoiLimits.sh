#!/bin/bash
# Apache POI limits for the Office files (xlsx, docx, pptx) SEMOSS opens. Each env var has the name of the
# RDF_Map.prop key it sets and only changes it when set. A key the template lacks is appended.
RDF=/opt/semosshome/RDF_Map.prop

KEYS=(
  POI_MAX_FILE_COUNT
  POI_BYTE_ARRAY_MAX_MB
)

esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

for KEY in "${KEYS[@]}"; do
  VALUE="${!KEY}"
  if [[ -n "$VALUE" ]]; then
    echo "Setting $KEY to $VALUE"
    if grep -q "^${KEY}\([[:space:]=:]\|\$\)" "$RDF"; then
      sed -i "s@^${KEY}\([[:space:]=:].*\)\?\$@${KEY}\t$(esc "$VALUE")@" "$RDF"
    else
      printf '%s\t%s\n' "$KEY" "$VALUE" >> "$RDF"
    fi
  fi
done
