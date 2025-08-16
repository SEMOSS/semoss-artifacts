#!/bin/bash

if [[ -z "${SCHEDULER_FORCE_DISABLE}" ]]; then 
     echo "No custom scheduler force disable"
else 
    sed -i "s@SCHEDULER_FORCE_DISABLE.*@SCHEDULER_FORCE_DISABLE\t$SCHEDULER_FORCE_DISABLE@g" /opt/semosshome/RDF_Map.prop
fi
if [[ -z "${SCHEDULER_ENDPOINT}" ]]; then 
    echo "No custom scheduler url defined" 
else 
    sed -i "s@SCHEDULER_ENDPOINT.*@SCHEDULER_ENDPOINT\t$SCHEDULER_ENDPOINT@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SCHEDULER_KEYSTORE_PASSWORD}" ]]; then 
     echo "No custom scheduler keystore password"
else 
    sed -i "s@SCHEDULER_KEYSTORE_PASSWORD.*@SCHEDULER_KEYSTORE_PASSWORD\t$SCHEDULER_KEYSTORE_PASSWORD@g" /opt/semosshome/RDF_Map.prop
fi
if [[ -z "${SCHEDULER_CERTIFICATE_PASSWORD}" ]]; then 
     echo "No custom scheduler cert password"
else 
    sed -i "s@SCHEDULER_CERTIFICATE_PASSWORD.*@SCHEDULER_CERTIFICATE_PASSWORD\t$SCHEDULER_CERTIFICATE_PASSWORD@g" /opt/semosshome/RDF_Map.prop
fi

# WE DONT WANT TO REPLACE SCHEDULER_KEYSTORE_PASSWORD with this value
if [[ -z "${SCHEDULER_KEYSTORE}" ]]; then 
     echo "No custom scheduler keystore"
else 
    # TODO: make statement use an or for a tab or space after SCHEDULER_KEYSTORE key
    sed -i "s@SCHEDULER_KEYSTORE\t.*@SCHEDULER_KEYSTORE\t$SCHEDULER_KEYSTORE@g" /opt/semosshome/RDF_Map.prop
    sed -i "s@SCHEDULER_KEYSTORE\s.*@SCHEDULER_KEYSTORE\t$SCHEDULER_KEYSTORE@g" /opt/semosshome/RDF_Map.prop
fi

