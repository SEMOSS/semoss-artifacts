if [[ -z "${A2A_ENABLED}" ]];
then echo "No A2A enabled setting defined"
else
sed -i "s@A2A_ENABLED.*@A2A_ENABLED\t$A2A_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${A2A_AGENT_CARD_BASE_URL}" ]];
then echo "No A2A agent card base URL defined"
else
sed -i "s@A2A_AGENT_CARD_BASE_URL.*@A2A_AGENT_CARD_BASE_URL\t$A2A_AGENT_CARD_BASE_URL@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${A2A_STREAM_REPLAY_LIMIT}" ]];
then echo "No A2A stream replay limit defined"
else
sed -i "s@A2A_STREAM_REPLAY_LIMIT.*@A2A_STREAM_REPLAY_LIMIT\t$A2A_STREAM_REPLAY_LIMIT@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${A2A_DEFAULT_MODEL_ID}" ]];
then echo "No A2A default model id defined"
else
sed -i "s@A2A_DEFAULT_MODEL_ID.*@A2A_DEFAULT_MODEL_ID\t$A2A_DEFAULT_MODEL_ID@g" /opt/semosshome/RDF_Map.prop
fi
