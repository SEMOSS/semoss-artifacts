#!/bin/bash

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

latest_version=`curl -s "https://oss.sonatype.org/content/groups/public/org/semoss/monolith/maven-metadata.xml" | grep "<release>.*</release>" | sed -e "s#\(.*\)\(<release>\)\(.*\)\(</release>\)\(.*\)#\3#g"`
 
if [ -f /opt/semoss-artifacts/ver.txt ]; then
        source /opt/semoss-artifacts/ver.txt
else
        version=0.0.1
fi

echo SEMOSS_VERSION environment variable is $SEMOSS_VERSION
echo latest version is $latest_version
echo current version is $version
 
# If the version is being overridden, or the latest version is greater than the current, then update
if ! [[ -z "${SEMOSS_VERSION}" ]] || [[ (( $latest_version > $version )) ]]; then
        # Always use the overridden version if provided 
        if [[ -z "${SEMOSS_VERSION}" ]]; then
                version=$latest_version
        else
                version="${SEMOSS_VERSION}"
        fi
        
        # Cleanup
        rm -rf /opt/semoss-artifacts/artifacts/home/semoss*
        rm -rf /opt/semoss-artifacts/artifacts/web/semoss*
        rm -rf /opt/semoss-artifacts/artifacts/war/monolith*
        rm -rf /opt/semoss-artifacts/artifacts/lib/monolith*
        rm -rf /root/.m2/repository/org/semoss
        cd /opt/semosshome
        find . -maxdepth 1 \! -name 'db' \! -name 'semoss-artifacts' \! -name '.' \! -name '..' -exec rm -rf {} +
        rm -rf $SCRIPT_TOMCAT_HOME/webapps/SemossWeb
        rm -rf $SCRIPT_TOMCAT_HOME/webapps/Monolith

        # Setup
        mkdir -p $SCRIPT_TOMCAT_HOME/webapps/SemossWeb
        mkdir -p $SCRIPT_TOMCAT_HOME/webapps/Monolith
        
        echo "Updating to version.. $version"
        cd /opt/semoss-artifacts/artifacts/home && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/home/semoss*/* /opt/semosshome
        cd /opt/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/web/semoss*/* $SCRIPT_TOMCAT_HOME/webapps/SemossWeb
        cd /opt/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/war/monolith*/* $SCRIPT_TOMCAT_HOME/webapps/Monolith
        cd /opt/semoss-artifacts/artifacts/lib && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/lib/monolith*/* $SCRIPT_TOMCAT_HOME/webapps/Monolith
        cp -r /opt/semoss-artifacts/x/RDF_Map.prop /opt/semosshome
        cp -r /opt/semoss-artifacts/x/social.properties /opt/semosshome
        cp -r /opt/semoss-artifacts/x/log4j.prop /opt/semosshome 
        cp -r /opt/semoss-artifacts/x/web.xml $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF 

        # RDF bugfix
        mv $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/lib/dsiutils-2.4.2.jar $SCRIPT_TOMCAT_HOME/lib

        echo "version=$latest_version" > /opt/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
