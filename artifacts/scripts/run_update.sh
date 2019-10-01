if [[ -z "${TOMCAT_HOME}" ]]; then
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

cd /opt/semoss-artifacts
# Because chmod looks like a chage to git
git checkout .
git pull
chmod 777 /opt/semoss-artifacts/artifacts/scripts/*
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev_no_lib.sh
cd $SCRIPT_TOMCAT_HOME/bin
./catalina.sh run
