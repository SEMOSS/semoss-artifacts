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

sed -i "s#UA-52251505-1#$GOOGLE_ANALYTICS_ID#g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/app.constants.js

if [ "$LEGACY_GOOGLE_ANALYTICS" = "true" ]
sed -i "s#LEGACY_GOOGLE_ANALYTICS', false#LEGACY_GOOGLE_ANALYTICS', true#g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/app.constants.js
fi
