sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/LocalMasterDatabase.smss
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewMaster/jdbc:h2:tcp:\/\/$REMOTE_LOCALMASTER_IP\/databaseNewMaster/g" /opt/semosshome/db/LocalMasterDatabase.smss
