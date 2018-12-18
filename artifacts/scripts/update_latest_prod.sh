#!/bin/bash

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
        rm -rf /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith

        # Setup
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith
        
        echo "Updating to version.. $version"
        cd /opt/semoss-artifacts/artifacts/home && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/home/semoss*/* /opt/semosshome
        cd /opt/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/web/semoss*/* /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        cd /opt/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/war/monolith*/* /opt/apache-tomcat-8.0.41/webapps/Monolith
        cd /opt/semoss-artifacts/artifacts/lib && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/lib/monolith*/* /opt/apache-tomcat-8.0.41/webapps/Monolith
        cp -r /opt/semoss-artifacts/x/RDF_Map.prop /opt/semosshome
        cp -r /opt/semoss-artifacts/x/social.properties /opt/semosshome
        cp -r /opt/semoss-artifacts/x/log4j.prop /opt/semosshome 
        cp -r /opt/semoss-artifacts/x/web.xml /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF 

        # RDF bugfix
        mv /opt/semoss-artifacts/artifacts/war/monolith-$version/WEB-INF/lib/dsiutils-2.4.2.jar /opt/apache-tomcat-8.0.41/lib

        echo "version=$latest_version" > /opt/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
