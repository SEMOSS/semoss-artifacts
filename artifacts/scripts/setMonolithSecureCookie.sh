# old - commenting out for now such that we can 
#sed -i "s#<secure>true</secure>#<secure>$MONOLITH_COOKIE_SET_SECURE</secure>#g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i "s#<secure>.*</secure>#<secure>$MONOLITH_COOKIE_SET_SECURE</secure>#g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
