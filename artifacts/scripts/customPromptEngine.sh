sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/PromptDatabase.smss

if [[ -z "${CUSTOM_PROMPT_RDBMS_TYPE}" ]];
then
  echo "Custom Prompt Engine RDBMS Type is not defined"
else
  echo "Custom Prompt Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_PROMPT_RDBMS_TYPE@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DRIVER}" ]];
then
  echo "Custom Prompt Driver is not defined"
else
  echo "Custom Prompt Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_PROMPT_DRIVER@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DATABASE}" ]];
then
  echo "Custom Prompt Database is not defined"
else
  echo "Custom Prompt Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_PROMPT_DATABASE@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_SCHEMA}" ]];
then
  echo "Custom Prompt Schema is not defined"
else
  echo "Custom Prompt Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_PROMPT_SCHEMA@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_USERNAME}" ]];
then
  echo "Custom Prompt USERNAME is not defined"
else
  echo "Custom Prompt USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_PROMPT_USERNAME@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_PASSWORD}" ]];
then
  echo "Custom Prompt PASSWORD is not defined"
else
  echo "Custom Prompt PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_PROMPT_PASSWORD@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_CONNECTION_URL}" ]];
then
  echo "Custom Prompt CONNECTION_URL is not defined"
else
  echo "Custom Prompt CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_PROMPT_CONNECTION_URL@g" /opt/semosshome/db/PromptDatabase.smss
fi
