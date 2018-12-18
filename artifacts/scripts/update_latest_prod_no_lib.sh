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
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/setAdmin
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/startUpFail
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/noUserFail
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/share
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes

        # Setup
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/setAdmin
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/startUpFail
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/noUserFail
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/share
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes
        find /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/lib -type f -name '*semoss*.jar' -delete

        echo "Updating to version.. $version"
        cd /opt/semoss-artifacts/artifacts/home && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/home/semoss*/* /opt/semosshome
        cd /opt/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/web/semoss*/* /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        cd /opt/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/META-INF/* /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/setAdmin/* /opt/apache-tomcat-8.0.41/webapps/Monolith/setAdmin
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/startUpFail/* /opt/apache-tomcat-8.0.41/webapps/Monolith/startUpFail
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/noUserFail/* /opt/apache-tomcat-8.0.41/webapps/Monolith/noUserFail
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/share/* /opt/apache-tomcat-8.0.41/webapps/Monolith/share
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/WEB-INF/classes/* /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes
        cp -r /opt/semoss-artifacts/artifacts/war/monolith-$version/WEB-INF/lib/semoss-$version.jar /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/lib
        cp -r /opt/semoss-artifacts/x/RDF_Map.prop /opt/semosshome
        cp -r /opt/semoss-artifacts/x/social.properties /opt/semosshome
        cp -r /opt/semoss-artifacts/x/log4j.prop /opt/semosshome 
        cp -r /opt/semoss-artifacts/x/web.xml /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF 

        # RDF bugfix
        mv /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/lib/dsiutils-2.4.2.jar /opt/apache-tomcat-8.0.41/lib

        echo "version=$latest_version" > /opt/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
