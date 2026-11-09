# collaboration (Brain/Work) settings in RDF_Map.prop; each key only changes when its env var is set
RDF=/opt/semosshome/RDF_Map.prop

# escape sed replacement specials so JSON values pass through
esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

# every key needs a line in x/RDF_Map.prop for sed to replace
KEYS=(
  COLLABORATION_DATABASE_ENABLED
  COLLAB_CLASSIFIER_ENGINE_ID
  COLLAB_CLASSIFIER_CUTOFFS
  COLLAB_CLASSIFIER_WINDOW
  COLLAB_CLASSIFY_PARALLEL
  COLLAB_LLM_ENGINE_ID
  COLLAB_ROUTINE_TIMEOUT_MINUTES
  COLLAB_MEMORY_PROMPT_CHARS
  COLLAB_ATTACHMENT_MAX_MB
  COLLAB_DELEGATION_MAX_FILES
  COLLAB_DELEGATION_MAX_FILE_MB
  COLLAB_DELEGATION_MAX_TOTAL_MB
  COLLAB_WORK_ITEMS_PARALLEL
  COLLAB_WORK_EXTRACT_PARALLEL
)

for KEY in "${KEYS[@]}"; do
  VALUE="${!KEY}"
  if [[ -n "$VALUE" ]]; then
    echo "Setting $KEY"
    # whole key only, so a key never rewrites the line of a longer one
    sed -i "s@^${KEY}[[:space:]=:].*@${KEY}\t$(esc "$VALUE")@" $RDF
  fi
done
