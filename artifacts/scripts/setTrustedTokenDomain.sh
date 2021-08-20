if [ -z "${TOMCAT_HOME}" ]; then
	SCRIPT_TOMCAT_HOME="$(ls /opt/ | grep "apache-tomcat")"
	echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        if [ -z "${SCRIPT_TOMCAT_HOME}" ]; then
                exit 1
        fi
else
	echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
	SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi

sed -i "/<web-app.*/,/<\/web-app>/ {/<filter>/,/<\/filter>/ {/<init-param>/,/<\/init-param/ {/<param-name>trustedTokenDomain<\/param-name>/,/<param-value>/ s/*/CONFIG_SET_CUSTOM_TRUSTED_DOMAIN/}}}" $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i "s|CONFIG_SET_CUSTOM_TRUSTED_DOMAIN|$TRUSTED_TOKEN_DOMAIN|g" $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
