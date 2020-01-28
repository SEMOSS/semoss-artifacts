sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" $SEMOSS_BASE/semosshome/db/security.smss
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_SECURITY_IP\/database/g" $SEMOSS_BASE/semosshome/db/security.smss
