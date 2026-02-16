#!/bin/bash
if [ -n "$PLAYWRIGHT_EXPORT" ]; then
    sed -i "s@PLAYWRIGHT_EXPORT.*@PLAYWRIGHT_EXPORT\t$PLAYWRIGHT_EXPORT@g" /opt/semosshome/RDF_Map.prop
fi
