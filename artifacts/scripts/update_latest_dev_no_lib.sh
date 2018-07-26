#!/bin/bash
export PATH=$PATH:/opt/apache-maven

latest_version=`curl -s "https://oss.sonatype.org/content/repositories/snapshots/org/semoss/monolith/maven-metadata.xml" | grep "<latest>.*</latest>" | sed -e "s#\(.*\)\(<latest>\)\(.*\)\(</latest>\)\(.*\)#\3#g"`
last_updated=`curl -s "https://oss.sonatype.org/content/repositories/snapshots/org/semoss/monolith/maven-metadata.xml" | grep "<lastUpdated>.*</lastUpdated>" | sed -e "s#\(.*\)\(<lastUpdated>\)\(.*\)\(</lastUpdated>\)\(.*\)#\3#g"`

if [ -f /opt/semosshome/semoss-artifacts/ver.txt ]; then
        source /opt/semosshome/semoss-artifacts/ver.txt
else
        version=0.0.1-SNAPSHOT
fi

echo SEMOSS_VERSION environment variable is $SEMOSS_VERSION
echo latest version is $latest_version
echo current version is $version
echo last updated is $last_updated

# If the version is being overridden, or the last updated is greater than the current, then update
if ! [[ -z "${SEMOSS_VERSION}" ]] || [[ (( $last_updated > $updated )) ]]; then
        # Always use the overridden version if provided 
        if [[ -z "${SEMOSS_VERSION}" ]]; then
                version=$latest_version
        else
                version="${SEMOSS_VERSION}"
        fi
        
        # Cleanup
        rm -rf /opt/semosshome/semoss-artifacts/artifacts/home/semoss*
        rm -rf /opt/semosshome/semoss-artifacts/artifacts/web/semoss*
        rm -rf /opt/semosshome/semoss-artifacts/artifacts/war/monolith*
        rm -rf /opt/semosshome/semoss-artifacts/artifacts/lib/monolith*
		rm -rf /root/.m2/repository/org/semoss
		cd /opt/semosshome
		find . -maxdepth 1 \! -name 'db' \! -name 'semoss-artifacts' \! -name '.' \! -name '..' -exec rm -rf {} +
   		rm -rf /opt/apache-tomcat-8.0.41/webapps/SemossWeb
		rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        rm -rf /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes
		
        # Setup
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith
		mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        mkdir -p /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes
		
        echo "Updating to version.. $version"
        cd /opt/semosshome/semoss-artifacts/artifacts/home && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/home/semoss*/* /opt/semosshome
        cd /opt/semosshome/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/web/semoss*/* /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        cd /opt/semosshome/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/war/monolith-$version/META-INF/* /opt/apache-tomcat-8.0.41/webapps/Monolith/META-INF
        cp -r /opt/semosshome/semoss-artifacts/artifacts/war/monolith-$version/WEB-INF/classes/* /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/classes
        cp -r /opt/semosshome/semoss-artifacts/artifacts/war/monolith-$version/WEB-INF/lib/semoss-$version.jar /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF/lib
        cp -r /opt/semosshome/semoss-artifacts/x/RDF_Map.prop /opt/semosshome 
        cp -r /opt/semosshome/semoss-artifacts/x/web.xml /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF 

        echo "version=$latest_version" > /opt/semosshome/semoss-artifacts/ver.txt
        echo "updated=$last_updated" >> /opt/semosshome/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
