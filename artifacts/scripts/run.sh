if [ -z "${TOMCAT_HOME}" ]; then
        if [ -d "/opt/apache-tomcat-8.0.41" ] 
        then 
                echo "Directory /opt/apache-tomcat-8.0.41 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-8.0.41
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        elif [ -d "/opt/apache-tomcat-8.5.46" ] 
        then
                echo "Directory /opt/apache-tomcat-8.5.46 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-8.5.46
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        else 
                echo "No Tomcat installation has been found"
        fi
else
        echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
        SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi

cd  $SCRIPT_TOMCAT_HOME/bin
./catalina.sh run
