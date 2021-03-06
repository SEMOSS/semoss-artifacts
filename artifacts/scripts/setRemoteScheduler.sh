sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/scheduler.smss

if [[ -z "${REMOTE_SCHEDULER_IP}" ]];
then
  echo "Remote Scheduler IP not defined. Using SCHEDULER_SERVICE_HOST and PORT"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$SCHEDULER_SERVICE_HOST:$SCHEDULER_SERVICE_PORT\/database;DB_CLOSE_ON_EXIT=FALSE;/g" /opt/semosshome/db/scheduler.smss
else
  echo "Remote Scheduler IP defined"
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_SCHEDULER_IP\/database;DB_CLOSE_ON_EXIT=FALSE;/g" /opt/semosshome/db/scheduler.smss
fi
