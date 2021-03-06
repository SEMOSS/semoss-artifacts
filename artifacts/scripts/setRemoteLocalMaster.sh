sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/LocalMasterDatabase.smss

if [[ -z "${REMOTE_LOCALMASTER_IP}" ]];
then
  echo "Remote Localmaster IP not defined. Using SERVICE_HOST and PORT"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewMaster/jdbc:h2:tcp:\/\/$LOCALMASTER_SERVICE_HOST:$LOCALMASTER_SERVICE_PORT\/databaseNewMaster/g" /opt/semosshome/db/LocalMasterDatabase.smss
else
  echo "Remote Localmaster IP defined"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewMaster/jdbc:h2:tcp:\/\/$REMOTE_LOCALMASTER_IP\/databaseNewMaster/g" /opt/semosshome/db/LocalMasterDatabase.smss
fi
