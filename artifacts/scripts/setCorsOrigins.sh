if [ -z "${TOMCAT_HOME}" ]; then
        if [ -d "/opt/apache-tomcat-8.0.41" ] 
        then 
                echo "Directory /opt/apache-tomcat-8.0.41 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-8.0.41
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        elif [ -d "/opt/apache-tomcat-9.0.26" ] 
        then
                echo "Directory /opt/apache-tomcat-9.0.26 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-9.0.26
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        else 
                echo "No Tomcat installation has been found"
        fi
else
        echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
        SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"

sed -i '/<web-app.*/,/<\/web-app>/ {/<filter>/,/<\/filter>/ {/<init-param>/,/<\/init-param/ {/<param-name>cors.allowed.origins<\/param-name>/,/<param-value>/ s/<param-value>/<param-value>CONFIG_SET_CUSTOM_CORS_ORIGINS/}}}' $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i "s|CONFIG_SET_CUSTOM_CORS_ORIGINS|$CORS_ALLOWED_ORIGINS|g" $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
