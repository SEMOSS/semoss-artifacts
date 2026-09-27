# collaboration (Brain/Work) settings in RDF_Map.prop; each key only changes when its env var is set
RDF=/opt/semosshome/RDF_Map.prop

# escape sed replacement specials so JSON values pass through
esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

if [[ -n "${COLLABORATION_DATABASE_ENABLED}" ]];
then
  echo "Setting COLLABORATION_DATABASE_ENABLED"
  sed -i "s@^COLLABORATION_DATABASE_ENABLED.*@COLLABORATION_DATABASE_ENABLED\t$(esc "$COLLABORATION_DATABASE_ENABLED")@" $RDF
fi

if [[ -n "${COLLAB_CLASSIFIER_ENGINE_ID}" ]];
then
  echo "Setting COLLAB_CLASSIFIER_ENGINE_ID"
  sed -i "s@^COLLAB_CLASSIFIER_ENGINE_ID.*@COLLAB_CLASSIFIER_ENGINE_ID\t$(esc "$COLLAB_CLASSIFIER_ENGINE_ID")@" $RDF
fi

if [[ -n "${COLLAB_CLASSIFIER_CUTOFFS}" ]];
then
  echo "Setting COLLAB_CLASSIFIER_CUTOFFS"
  sed -i "s@^COLLAB_CLASSIFIER_CUTOFFS.*@COLLAB_CLASSIFIER_CUTOFFS\t$(esc "$COLLAB_CLASSIFIER_CUTOFFS")@" $RDF
fi
