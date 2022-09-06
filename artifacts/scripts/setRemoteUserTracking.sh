sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/UserTrackingDatabase.smss

if [[ -z "${REMOTE_USERTRACKING_IP}" ]];
then
  echo "Remote UserTracking IP not defined. Using SERVICE_HOST and PORT"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewUserTracking/jdbc:h2:tcp:\/\/$USERTRACKING_SERVICE_HOST:$USERTRACKING_SERVICE_PORT\/databaseNewUserTracking;query_timeout=180000;early_filter=true;query_cache_size=24;cache_size=32768/g" /opt/semosshome/db/UserTrackingDatabase.smss
else
  echo "Remote UserTracking IP defined"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewUserTracking/jdbc:h2:tcp:\/\/$REMOTE_USERTRACKING_IP\/databaseNewUserTracking;query_timeout=180000;early_filter=true;query_cache_size=24;cache_size=32768/g" /opt/semosshome/db/UserTrackingDatabase.smss
fi
