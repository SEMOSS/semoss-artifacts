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
fi

# Default to 2MB if not provided by the environment.
: "${SEMOSS_MAX_POST_SIZE:=2097152}"
export CATALINA_OPTS="$CATALINA_OPTS -Dsemoss.maxPostSize=${SEMOSS_MAX_POST_SIZE}"

cd  $SCRIPT_TOMCAT_HOME/bin
./catalina.sh run
