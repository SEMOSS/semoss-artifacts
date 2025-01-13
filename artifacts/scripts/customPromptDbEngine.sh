sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/PromptDatabase.smss

if [[ -z "${CUSTOM_PROMPT_DB_RDBMS_TYPE}" ]];
then
  echo "Custom Prompt Database Engine RDBMS Type is not defined"
else
  echo "Custom Prompt Database Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_PROMPT_DB_RDBMS_TYPE@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_DRIVER}" ]];
then
  echo "Custom Prompt Database Driver is not defined"
else
  echo "Custom Prompt Database Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_PROMPT_DB_DRIVER@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_DATABASE}" ]];
then
  echo "Custom Prompt Database Database is not defined"
else
  echo "Custom Prompt Database Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_PROMPT_DB_DATABASE@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_SCHEMA}" ]];
then
  echo "Custom Prompt Database Schema is not defined"
else
  echo "Custom Prompt Database Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_PROMPT_DB_SCHEMA@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_USERNAME}" ]];
then
  echo "Custom Prompt Database USERNAME is not defined"
else
  echo "Custom Prompt Database USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_PROMPT_DB_USERNAME@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_PASSWORD}" ]];
then
  echo "Custom Prompt Database PASSWORD is not defined"
else
  echo "Custom Prompt Database PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_PROMPT_DB_PASSWORD@g" /opt/semosshome/db/PromptDatabase.smss
fi

if [[ -z "${CUSTOM_PROMPT_DB_CONNECTION_URL}" ]];
then
  echo "Custom Prompt Database CONNECTION_URL is not defined"
else
  echo "Custom Prompt Database CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_PROMPT_DB_CONNECTION_URL@g" /opt/semosshome/db/PromptDatabase.smss
fi
