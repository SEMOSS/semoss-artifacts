if [[ -z "${AGENT_SANDBOX_ENABLE}" ]];
then echo "No defined agent sandbox enable flag"
else
sed -i "s@AGENT_SANDBOX_ENABLE.*@AGENT_SANDBOX_ENABLE\t$AGENT_SANDBOX_ENABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_SANDBOX_DEFAULT_READS}" ]];
then echo "No defined agent sandbox default reads"
else
sed -i "s@AGENT_SANDBOX_DEFAULT_READS.*@AGENT_SANDBOX_DEFAULT_READS\t$AGENT_SANDBOX_DEFAULT_READS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_SANDBOX_BLOCK_READS}" ]];
then echo "No defined agent sandbox blocked reads"
else
sed -i "s@AGENT_SANDBOX_BLOCK_READS.*@AGENT_SANDBOX_BLOCK_READS\t$AGENT_SANDBOX_BLOCK_READS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AGENT_SANDBOX_LOOPBACK_NETWORK}" ]];
then echo "No defined agent sandbox loopback network"
else
sed -i "s@AGENT_SANDBOX_LOOPBACK_NETWORK.*@AGENT_SANDBOX_LOOPBACK_NETWORK\t$AGENT_SANDBOX_LOOPBACK_NETWORK@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${CLAUDE_CODE_CLI_PATH}" ]];
then echo "No defined Claude Code CLI path"
else
sed -i "s@CLAUDE_CODE_CLI_PATH.*@CLAUDE_CODE_CLI_PATH\t$CLAUDE_CODE_CLI_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${GITHUB_COPILOT_CLI_PATH}" ]];
then echo "No defined GitHub Copilot CLI path"
else
sed -i "s@GITHUB_COPILOT_CLI_PATH.*@GITHUB_COPILOT_CLI_PATH\t$GITHUB_COPILOT_CLI_PATH@g" /opt/semosshome/RDF_Map.prop
fi
