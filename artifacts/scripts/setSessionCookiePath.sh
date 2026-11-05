# Sets the session cookie path value to 'path=/'
if [ -z "${TOMCAT_HOME}" ]; then
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
sed -i 's/<Context>/<Context sessionCookiePath="\/">/' $SCRIPT_TOMCAT_HOME/conf/context.xml


  
