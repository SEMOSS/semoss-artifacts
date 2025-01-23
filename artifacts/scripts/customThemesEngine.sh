sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/themes.smss

if [[ -z "${CUSTOM_THEMES_RDBMS_TYPE}" ]];
then
  echo "Custom themes Engine RDBMS Type is not defined"
else
  echo "Custom themes Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_THEMES_RDBMS_TYPE@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_DRIVER}" ]];
then
  echo "Custom themes Driver is not defined"
else
  echo "Custom themes Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_THEMES_DRIVER@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_DATABASE}" ]];
then
  echo "Custom themes Database is not defined"
else
  echo "Custom themes Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_THEMES_DATABASE@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_SCHEMA}" ]];
then
  echo "Custom themes Schema is not defined"
else
  echo "Custom themes Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_THEMES_SCHEMA@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_USERNAME}" ]];
then
  echo "Custom themes USERNAME is not defined"
else
  echo "Custom themes USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_THEMES_USERNAME@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_PASSWORD}" ]];
then
  echo "Custom themes PASSWORD is not defined"
else
  echo "Custom themes PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_THEMES_PASSWORD@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_CONNECTION_URL}" ]];
then
  echo "Custom themes CONNECTION_URL is not defined"
else
  echo "Custom themes CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_THEMES_CONNECTION_URL@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom themes USE_CONNECTION_POOLING is not defined"
else
  echo "Custom themes USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_THEMES_USE_CONNECTION_POOLING@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_POOL_MIN_SIZE}" ]];
then
  echo "Custom themes POOL_MIN_SIZE is not defined"
else
  echo "Custom themes POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_THEMES_POOL_MIN_SIZE@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_POOL_MAX_SIZE}" ]];
then
  echo "Custom themes POOL_MAX_SIZE is not defined"
else
  echo "Custom themes POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_THEMES_POOL_MAX_SIZE@g" /opt/semosshome/db/themes.smss
fi

if [[ -z "${CUSTOM_THEMES_AUTO_COMMIT}" ]];
then
  echo "Custom themes AUTO_COMMIT is not defined"
else
  echo "Custom themes AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_THEMES_USE_AUTO_COMMIT@g" /opt/semosshome/db/themes.smss
fi