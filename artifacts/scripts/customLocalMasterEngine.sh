sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/LocalMasterDatabase.smss

if [[ -z "${CUSTOM_LM_RDBMS_TYPE}" ]];
then
  echo "Custom Localmaster Engine RDBMS Type is not defined"
else
  echo "Custom Localmaster Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_LM_RDBMS_TYPE@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_DRIVER}" ]];
then
  echo "Custom Localmaster Driver is not defined"
else
  echo "Custom Localmaster Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_LM_DRIVER@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_DATABASE}" ]];
then
  echo "Custom Localmaster Database is not defined"
else
  echo "Custom Localmaster Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_LM_DATABASE@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_SCHEMA}" ]];
then
  echo "Custom Localmaster Schema is not defined"
else
  echo "Custom Localmaster Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_LM_SCHEMA@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_USERNAME}" ]];
then
  echo "Custom Localmaster USERNAME is not defined"
else
  echo "Custom Localmaster USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_LM_USERNAME@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_PASSWORD}" ]];
then
  echo "Custom Localmaster PASSWORD is not defined"
else
  echo "Custom Localmaster PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_LM_PASSWORD@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_CONNECTION_URL}" ]];
then
  echo "Custom Localmaster CONNECTION_URL is not defined"
else
  echo "Custom Localmaster CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_LM_CONNECTION_URL@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom Localmaster USE_CONNECTION_POOLING is not defined"
else
  echo "Custom Localmaster USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_LM_USE_CONNECTION_POOLING@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_POOL_MIN_SIZE}" ]];
then
  echo "Custom Localmaster POOL_MIN_SIZE is not defined"
else
  echo "Custom Localmaster POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_LM_POOL_MIN_SIZE@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_POOL_MAX_SIZE}" ]];
then
  echo "Custom Localmaster POOL_MAX_SIZE is not defined"
else
  echo "Custom Localmaster POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_LM_POOL_MAX_SIZE@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi

if [[ -z "${CUSTOM_LM_AUTO_COMMIT}" ]];
then
  echo "Custom Localmaster AUTO_COMMIT is not defined"
else
  echo "Custom Localmaster AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_LM_USE_AUTO_COMMIT@g" /opt/semosshome/db/LocalMasterDatabase.smss
fi
