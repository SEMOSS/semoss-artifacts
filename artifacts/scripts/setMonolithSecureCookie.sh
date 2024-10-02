sed -i "s#<secure>true</secure>#<secure>$MONOLITH_COOKIE_SET_SECURE</secure>#g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
