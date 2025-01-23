sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/scheduler.smss

if [[ -z "${CUSTOM_SCHEDULER_RDBMS_TYPE}" ]];
then
  echo "Custom scheduler Engine RDBMS Type is not defined"
else
  echo "Custom scheduler Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_SCHEDULER_RDBMS_TYPE@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_DRIVER}" ]];
then
  echo "Custom scheduler Driver is not defined"
else
  echo "Custom scheduler Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_SCHEDULER_DRIVER@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_DATABASE}" ]];
then
  echo "Custom scheduler Database is not defined"
else
  echo "Custom scheduler Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_SCHEDULER_DATABASE@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_SCHEMA}" ]];
then
  echo "Custom scheduler Schema is not defined"
else
  echo "Custom scheduler Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_SCHEDULER_SCHEMA@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_USERNAME}" ]];
then
  echo "Custom scheduler USERNAME is not defined"
else
  echo "Custom scheduler USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_SCHEDULER_USERNAME@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_PASSWORD}" ]];
then
  echo "Custom scheduler PASSWORD is not defined"
else
  echo "Custom scheduler PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_SCHEDULER_PASSWORD@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_CONNECTION_URL}" ]];
then
  echo "Custom scheduler CONNECTION_URL is not defined"
else
  echo "Custom scheduler CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_SCHEDULER_CONNECTION_URL@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom scheduler USE_CONNECTION_POOLING is not defined"
else
  echo "Custom scheduler USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_SCHEDULER_USE_CONNECTION_POOLING@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_POOL_MIN_SIZE}" ]];
then
  echo "Custom scheduler POOL_MIN_SIZE is not defined"
else
  echo "Custom scheduler POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_SCHEDULER_POOL_MIN_SIZE@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_POOL_MAX_SIZE}" ]];
then
  echo "Custom scheduler POOL_MAX_SIZE is not defined"
else
  echo "Custom scheduler POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_SCHEDULER_POOL_MAX_SIZE@g" /opt/semosshome/db/scheduler.smss
fi

if [[ -z "${CUSTOM_SCHEDULER_AUTO_COMMIT}" ]];
then
  echo "Custom scheduler AUTO_COMMIT is not defined"
else
  echo "Custom scheduler AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_SCHEDULER_USE_AUTO_COMMIT@g" /opt/semosshome/db/scheduler.smss
fi
