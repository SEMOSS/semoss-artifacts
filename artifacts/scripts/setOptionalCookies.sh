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

if [[ -z $OPTIONAL_COOKIES ]]; then
echo "No change in optional cookies"
else sed -i "s@.constant('OPTIONAL_COOKIES'.*@.constant('OPTIONAL_COOKIES',$OPTIONAL_COOKIES)@g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/packages/legacy/app.constants.js
fi

