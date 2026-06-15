if [[ -z "${ROOM_MESSAGE_STORE_LOCK_TTL_MS}" ]];
then echo "No room message store lock ttl defined"
else
sed -i "s@ROOM_MESSAGE_STORE_LOCK_TTL_MS.*@ROOM_MESSAGE_STORE_LOCK_TTL_MS\t$ROOM_MESSAGE_STORE_LOCK_TTL_MS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${ROOM_MESSAGE_STORE_LOCK_WAIT_MS}" ]];
then echo "No room message store lock wait defined"
else
sed -i "s@ROOM_MESSAGE_STORE_LOCK_WAIT_MS.*@ROOM_MESSAGE_STORE_LOCK_WAIT_MS\t$ROOM_MESSAGE_STORE_LOCK_WAIT_MS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_RUN_QUEUE_ENABLED}" ]];
then echo "No agent run queue enabled override defined"
else
sed -i "s@AGENT_RUN_QUEUE_ENABLED.*@AGENT_RUN_QUEUE_ENABLED\t$AGENT_RUN_QUEUE_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_RUN_ACTIVE_TTL_MS}" ]];
then echo "No agent run active ttl defined"
else
sed -i "s@AGENT_RUN_ACTIVE_TTL_MS.*@AGENT_RUN_ACTIVE_TTL_MS\t$AGENT_RUN_ACTIVE_TTL_MS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_RUN_WAIT_TIMEOUT_MS}" ]];
then echo "No agent run wait timeout defined"
else
sed -i "s@AGENT_RUN_WAIT_TIMEOUT_MS.*@AGENT_RUN_WAIT_TIMEOUT_MS\t$AGENT_RUN_WAIT_TIMEOUT_MS@g" /opt/semosshome/RDF_Map.prop
fi
