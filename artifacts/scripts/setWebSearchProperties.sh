#!/bin/bash
# web search in RDF_Map.prop; only turn it on where a SearXNG service runs (SEARXNG_URL points at it)
RDF=/opt/semosshome/RDF_Map.prop

# escape sed replacement specials so any value passes through
esc() { printf '%s' "$1" | sed -e 's/[\\&@]/\\&/g'; }

if [[ -n "${WEB_SEARCH_ENABLED}" ]];
then
  echo "Setting WEB_SEARCH_ENABLED"
  sed -i "s@^WEB_SEARCH_ENABLED.*@WEB_SEARCH_ENABLED\t$(esc "$WEB_SEARCH_ENABLED")@" "$RDF"
fi
