sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/AuditLogs.smss

if [[ -z "${CUSTOM_AUDITLOGS_RDBMS_TYPE}" ]];
then
  echo "Custom Audit Logs Engine RDBMS Type is not defined"
else
  echo "Custom Audit Logs Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_AUDITLOGS_RDBMS_TYPE@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_DRIVER}" ]];
then
  echo "Custom Audit Logs Driver is not defined"
else
  echo "Custom Audit Logs Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_AUDITLOGS_DRIVER@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_DATABASE}" ]];
then
  echo "Custom Audit Logs Database is not defined"
else
  echo "Custom Audit Logs Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_AUDITLOGS_DATABASE@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_SCHEMA}" ]];
then
  echo "Custom Audit Logs Schema is not defined"
else
  echo "Custom Audit Logs Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_AUDITLOGS_SCHEMA@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_USERNAME}" ]];
then
  echo "Custom Audit Logs USERNAME is not defined"
else
  echo "Custom Audit Logs USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_AUDITLOGS_USERNAME@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_PASSWORD}" ]];
then
  echo "Custom Audit Logs PASSWORD is not defined"
else
  echo "Custom Audit Logs PASSWORD is defined"
  sed -i "s|PASSWORD.*|PASSWORD\t$CUSTOM_AUDITLOGS_PASSWORD|g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_CONNECTION_URL}" ]];
then
  echo "Custom Audit Logs CONNECTION_URL is not defined"
else
  echo "Custom Audit Logs CONNECTION_URL is defined"
  sed -i "s|CONNECTION_URL.*|CONNECTION_URL\t$CUSTOM_AUDITLOGS_CONNECTION_URL|g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom Audit Logs USE_CONNECTION_POOLING is not defined"
else
  echo "Custom Audit Logs USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_AUDITLOGS_USE_CONNECTION_POOLING@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_POOL_MIN_SIZE}" ]];
then
  echo "Custom Audit Logs POOL_MIN_SIZE is not defined"
else
  echo "Custom Audit Logs POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_AUDITLOGS_POOL_MIN_SIZE@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_POOL_MAX_SIZE}" ]];
then
  echo "Custom Audit Logs POOL_MAX_SIZE is not defined"
else
  echo "Custom Audit Logs POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_AUDITLOGS_POOL_MAX_SIZE@g" /opt/semosshome/db/AuditLogs.smss
fi

if [[ -z "${CUSTOM_AUDITLOGS_USE_AUTO_COMMIT}" ]];
then
  echo "Custom Audit Logs AUTO_COMMIT is not defined"
else
  echo "Custom Audit Logs AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_AUDITLOGS_USE_AUTO_COMMIT@g" /opt/semosshome/db/AuditLogs.smss
fi