if [ -z "${TOMCAT_HOME}" ]; then
	# TOMCAT_HOME is normally exported by the Dockerfile; discover it otherwise
	SCRIPT_TOMCAT_HOME=$(ls -d /opt/apache-tomcat-*/ 2>/dev/null | sort -V | tail -n 1)
	SCRIPT_TOMCAT_HOME="${SCRIPT_TOMCAT_HOME%/}"
	echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        if [ -z "${SCRIPT_TOMCAT_HOME}" ]; then
                exit 1
        fi
else
	echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
	SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi
sed -i "s#Monolith#$MONOLITH_APPCONSTANT#g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/packages/legacy/app.constants.js
