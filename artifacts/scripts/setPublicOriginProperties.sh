#!/bin/bash
# public callback urls in RDF_Map.prop, for when the app's own url is not one Microsoft or GitHub can reach;
# each key only changes when its env var is set
RDF=/opt/semosshome/RDF_Map.prop

# escape sed replacement specials so urls with & or @ pass through
esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

# scheme://host[:port]; the app url's path is kept
if [[ -n "${MS_PUBLIC_ORIGIN_OVERRIDE}" ]];
then
  echo "Setting MS_PUBLIC_ORIGIN_OVERRIDE"
  sed -i "s@^MS_PUBLIC_ORIGIN_OVERRIDE.*@MS_PUBLIC_ORIGIN_OVERRIDE\t$(esc "$MS_PUBLIC_ORIGIN_OVERRIDE")@" "$RDF"
fi

# scheme://host[:port]; the app url's path is kept
if [[ -n "${GH_PUBLIC_ORIGIN_OVERRIDE}" ]];
then
  echo "Setting GH_PUBLIC_ORIGIN_OVERRIDE"
  sed -i "s@^GH_PUBLIC_ORIGIN_OVERRIDE.*@GH_PUBLIC_ORIGIN_OVERRIDE\t$(esc "$GH_PUBLIC_ORIGIN_OVERRIDE")@" "$RDF"
fi

# the full url GitHub posts webhook events to
if [[ -n "${GH_WEBHOOK_URL_OVERRIDE}" ]];
then
  echo "Setting GH_WEBHOOK_URL_OVERRIDE"
  sed -i "s@^GH_WEBHOOK_URL_OVERRIDE.*@GH_WEBHOOK_URL_OVERRIDE\t$(esc "$GH_WEBHOOK_URL_OVERRIDE")@" "$RDF"
fi
