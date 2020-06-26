sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/scheduler.smss
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_SECURITY_IP\/database/g" /opt/semosshome/db/scheduler.smss
