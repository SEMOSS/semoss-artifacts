sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/scheduler.smss
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_SCHEDULER_IP\/database;DB_CLOSE_ON_EXIT=FALSE;/g" /opt/semosshome/db/scheduler.smss
