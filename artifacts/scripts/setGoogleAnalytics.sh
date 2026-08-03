if [ -z "${TOMCAT_HOME}" ]; then
        # TOMCAT_HOME is normally exported by the Dockerfile; discover it otherwise
        SCRIPT_TOMCAT_HOME=$(ls -d /opt/apache-tomcat-*/ 2>/dev/null | sort -V | tail -n 1)
        SCRIPT_TOMCAT_HOME="${SCRIPT_TOMCAT_HOME%/}"
        if [ -n "$SCRIPT_TOMCAT_HOME" ]
        then
                echo "Directory $SCRIPT_TOMCAT_HOME exists."
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        else
                echo "No Tomcat installation has been found"
        fi
else
        echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
        SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi

sed -i "s#UA-52251505-1#$GOOGLE_ANALYTICS_ID#g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/packages/legacy/app.constants.js

if [ "$LEGACY_GOOGLE_ANALYTICS" = "true" ]
then
sed -i "s#LEGACY_GOOGLE_ANALYTICS', false#LEGACY_GOOGLE_ANALYTICS', true#g" $SCRIPT_TOMCAT_HOME/webapps/SemossWeb/packages/legacy/app.constants.js
fi
