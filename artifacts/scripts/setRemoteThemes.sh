sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/themes.smss

if [[ -z "${REMOTE_THEMES_IP}" ]];
then
  echo "Remote Themes IP not defined. Using SERVICE_HOST and PORT"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$THEMES_SERVICE_HOST:$THEMES_SERVICE_PORT\/database/g" /opt/semosshome/db/themes.smss
else
  echo "Remote Themes IP defined"
  sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/database/jdbc:h2:tcp:\/\/$REMOTE_THEMES_IP\/database/g" /opt/semosshome/db/themes.smss
fi
