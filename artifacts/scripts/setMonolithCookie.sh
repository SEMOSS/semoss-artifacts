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
sed -i "s#<name>monolith</name>#<name>$MONOLITH_COOKIE</name>#g" $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
