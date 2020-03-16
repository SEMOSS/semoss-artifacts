sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/security.smss
sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$SECURITY_SERVICE_HOST:$SECURITY_SERVICE_PORT\/database/g" /opt/semosshome/db/security.smss
