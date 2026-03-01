#!/bin/bash
if [ -n "$NODE_SERVER_ENDPOINT" ]; then
    sed -i "s@NODE_SERVER_ENDPOINT.*@NODE_SERVER_ENDPOINT\t$NODE_SERVER_ENDPOINT@g" /opt/semosshome/RDF_Map.prop
fi
