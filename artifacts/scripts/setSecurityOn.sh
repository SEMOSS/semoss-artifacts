# if [ -z "${TOMCAT_HOME}" ]; then
# 	SCRIPT_TOMCAT_HOME="$(ls /opt/ | grep "apache-tomcat")"
# 	echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
#         if [ -z "${SCRIPT_TOMCAT_HOME}" ]; then
#                 exit 1
#         fi
# else
# 	echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
# 	SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
# fi
# sed -i '/<web-app.*/,/<\/web-app>/ {/<context-param>/,/<\/context-param>/ {/<param-name>security-enabled<\/param-name>/,/<param-value>/ s/false/true/}}' $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
