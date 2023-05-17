sed -i "s@SAMESITE_COOKIE.*@SAMESITE_COOKIE\t$SAMESITE_COOKIE@g" /opt/semosshome/RDF_Map.prop
sed -i "s@sameSiteCookies=\".*\"@sameSiteCookies=\"$SAMESITE_COOKIE\"@g" $TOMCAT_HOME/conf/context.xml
