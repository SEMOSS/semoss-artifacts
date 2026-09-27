# older semosshome builds do not ship the collaboration smss
if [[ ! -f /opt/semosshome/db/Collaboration.smss ]];
then
  echo "Collaboration smss is missing, writing the default"
  mkdir -p /opt/semosshome/db/Collaboration
  cat > /opt/semosshome/db/Collaboration.smss <<'SMSS'
#Base Properties
ENGINE	Collaboration
ENGINE_TYPE	prerna.engine.impl.rdbms.H2EmbeddedServerEngine
OWL	Collaboration_OWL.OWL

RDBMS_TYPE	H2_DB
DATABASE	
SCHEMA	PUBLIC
DRIVER org.h2.Driver
USERNAME        sa
PASSWORD	
CONNECTION_URL	jdbc:h2:nio:@BaseFolder@/db/@ENGINE@/database;query_timeout=180000;early_filter=true;query_cache_size=24;cache_size=32768
USE_CONNECTION_POOLING	true
POOL_MIN_SIZE       10
POOL_MAX_SIZE       50
AUTO_COMMIT         false

DATABASE_ZONEID UTC
SMSS
fi

sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/Collaboration.smss

if [[ -z "${CUSTOM_COLLABORATION_RDBMS_TYPE}" ]];
then
  echo "Custom Collaboration Engine RDBMS Type is not defined"
else
  echo "Custom Collaboration Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_COLLABORATION_RDBMS_TYPE@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_DRIVER}" ]];
then
  echo "Custom Collaboration Driver is not defined"
else
  echo "Custom Collaboration Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_COLLABORATION_DRIVER@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_DATABASE}" ]];
then
  echo "Custom Collaboration Database is not defined"
else
  echo "Custom Collaboration Database is defined"
  sed -i "s@^DATABASE[[:space:]]\+.*@DATABASE\t$CUSTOM_COLLABORATION_DATABASE@" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_SCHEMA}" ]];
then
  echo "Custom Collaboration Schema is not defined"
else
  echo "Custom Collaboration Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_COLLABORATION_SCHEMA@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_USERNAME}" ]];
then
  echo "Custom Collaboration USERNAME is not defined"
else
  echo "Custom Collaboration USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_COLLABORATION_USERNAME@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_PASSWORD}" ]];
then
  echo "Custom Collaboration PASSWORD is not defined"
else
  echo "Custom Collaboration PASSWORD is defined"
  sed -i "s|PASSWORD.*|PASSWORD\t$CUSTOM_COLLABORATION_PASSWORD|g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_CONNECTION_URL}" ]];
then
  echo "Custom Collaboration CONNECTION_URL is not defined"
else
  echo "Custom Collaboration CONNECTION_URL is defined"
  sed -i "s|CONNECTION_URL.*|CONNECTION_URL\t$CUSTOM_COLLABORATION_CONNECTION_URL|g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom Collaboration USE_CONNECTION_POOLING is not defined"
else
  echo "Custom Collaboration USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_COLLABORATION_USE_CONNECTION_POOLING@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_POOL_MIN_SIZE}" ]];
then
  echo "Custom Collaboration POOL_MIN_SIZE is not defined"
else
  echo "Custom Collaboration POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_COLLABORATION_POOL_MIN_SIZE@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_POOL_MAX_SIZE}" ]];
then
  echo "Custom Collaboration POOL_MAX_SIZE is not defined"
else
  echo "Custom Collaboration POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_COLLABORATION_POOL_MAX_SIZE@g" /opt/semosshome/db/Collaboration.smss
fi

if [[ -z "${CUSTOM_COLLABORATION_USE_AUTO_COMMIT}" ]];
then
  echo "Custom Collaboration AUTO_COMMIT is not defined"
else
  echo "Custom Collaboration AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_COLLABORATION_USE_AUTO_COMMIT@g" /opt/semosshome/db/Collaboration.smss
fi