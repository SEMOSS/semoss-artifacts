sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/UserTrackingDatabase.smss

if [[ -z "${CUSTOM_USER_TRACKING_RDBMS_TYPE}" ]];
then
  echo "Custom user tracking Engine RDBMS Type is not defined"
else
  echo "Custom user tracking Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_USER_TRACKING_RDBMS_TYPE@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_DRIVER}" ]];
then
  echo "Custom user tracking Driver is not defined"
else
  echo "Custom user tracking Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_USER_TRACKING_DRIVER@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_DATABASE}" ]];
then
  echo "Custom user tracking Database is not defined"
else
  echo "Custom user tracking Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_USER_TRACKING_DATABASE@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_SCHEMA}" ]];
then
  echo "Custom user tracking Schema is not defined"
else
  echo "Custom user tracking Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_USER_TRACKING_SCHEMA@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_USERNAME}" ]];
then
  echo "Custom user tracking USERNAME is not defined"
else
  echo "Custom user tracking USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_USER_TRACKING_USERNAME@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_PASSWORD}" ]];
then
  echo "Custom user tracking PASSWORD is not defined"
else
  echo "Custom user tracking PASSWORD is defined"
  sed -i "s|PASSWORD.*|PASSWORD\t$CUSTOM_USER_TRACKING_PASSWORD|g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_CONNECTION_URL}" ]];
then
  echo "Custom user tracking CONNECTION_URL is not defined"
else
  echo "Custom user tracking CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_USER_TRACKING_CONNECTION_URL@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom user tracking USE_CONNECTION_POOLING is not defined"
else
  echo "Custom user tracking USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_USER_TRACKING_USE_CONNECTION_POOLING@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_POOL_MIN_SIZE}" ]];
then
  echo "Custom user tracking POOL_MIN_SIZE is not defined"
else
  echo "Custom user tracking POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_USER_TRACKING_POOL_MIN_SIZE@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_POOL_MAX_SIZE}" ]];
then
  echo "Custom user tracking POOL_MAX_SIZE is not defined"
else
  echo "Custom user tracking POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_USER_TRACKING_POOL_MAX_SIZE@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi

if [[ -z "${CUSTOM_USER_TRACKING_AUTO_COMMIT}" ]];
then
  echo "Custom user tracking AUTO_COMMIT is not defined"
else
  echo "Custom user tracking AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_USER_TRACKING_USE_AUTO_COMMIT@g" /opt/semosshome/db/UserTrackingDatabase.smss
fi
