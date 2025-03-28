#!/bin/bash
#enable cors - activate using $ENABLE_CORS true
sed -i '/<!--CORS_FILTER_FLAG/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i '/CORS_FILTER_FLAG_END-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml

#setting cors allowed origin
sed -i '/<web-app.*/,/<\/web-app>/ {/<filter>/,/<\/filter>/ {/<init-param>/,/<\/init-param/ {/<param-name>cors.allowed.origins<\/param-name>/,/<param-value>/  s/*/CONFIG_SET_CUSTOM_CORS_ORIGINS/}}}' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i "s|CONFIG_SET_CUSTOM_CORS_ORIGINS|$CORS_ALLOWED_ORIGINS|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml

#setting support credentials
sed -i '/<web-app.*/,/<\/web-app>/ {/<filter>/,/<\/filter>/ {/<init-param>/,/<\/init-param/ {/<param-name>cors.support.credentials<\/param-name>/,/<param-value>/  s/false/CONFIG_SET_CUSTOM_CORS_SUPPORT_CREDENTIALS/}}}' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i "s|CONFIG_SET_CUSTOM_CORS_SUPPORT_CREDENTIALS|$CORS_SUPPORT_CREDENTIALSS|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
