if [[ -z "${AGENT_DEFAULT_TOOLS_MCP_PROJECT_ID}" ]];
then echo "No default agent tools MCP project id defined"
else
sed -i "s@AGENT_DEFAULT_TOOLS_MCP_PROJECT_ID.*@AGENT_DEFAULT_TOOLS_MCP_PROJECT_ID\t$AGENT_DEFAULT_TOOLS_MCP_PROJECT_ID@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_DEFAULT_TOOLS_ENABLE_BASH}" ]];
then echo "No default agent tools bash setting defined"
else
sed -i "s@AGENT_DEFAULT_TOOLS_ENABLE_BASH.*@AGENT_DEFAULT_TOOLS_ENABLE_BASH\t$AGENT_DEFAULT_TOOLS_ENABLE_BASH@g" /opt/semosshome/RDF_Map.prop
fi
