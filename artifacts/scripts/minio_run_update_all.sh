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

cd /opt/semoss-artifacts
# Because chmod looks like a chage to git
git checkout .
git pull
chmod 777 /opt/semoss-artifacts/artifacts/scripts/*
minio.sh
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev.sh
cd $SCRIPT_TOMCAT_HOME/bin
./catalina.sh run
