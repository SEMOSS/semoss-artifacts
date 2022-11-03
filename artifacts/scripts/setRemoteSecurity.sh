sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/security.smss

if [[ -z "${REMOTE_SECURITY_IP}" ]];
then
  echo "Remote Security IP not defined. Using SERVICE_HOST and PORT"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$SECURITY_SERVICE_HOST:$SECURITY_SERVICE_PORT\/database/g" /opt/semosshome/db/security.smss
else
  echo "Remote Security IP defined: it is $REMOTE_SECURITY_IP ip"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_SECURITY_IP\/database/g" /opt/semosshome/db/security.smss
fi
