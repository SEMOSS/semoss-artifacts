export PATH=$PATH:/opt/apache-maven

latest_version=`curl -s "https://oss.sonatype.org/content/repositories/snapshots/org/semoss/monolith/maven-metadata.xml" | grep "<latest>.*</latest>" | sed -e "s#\(.*\)\(<latest>\)\(.*\)\(</latest>\)\(.*\)#\3#g"`

if [ -f /opt/semosshome/semoss-artifacts/ver.txt ]; then
        source /opt/semosshome/semoss-artifacts/ver.txt
else
        version=0.0.1-SNAPSHOT
fi

echo current version is $version
 
if [ "$#" -gt 0 ] && [[ (( $latest_version > $version )) ]]; then
        version=$latest_version
        echo "Updating to version.. $version"
        cd /opt/semosshome/semoss-artifacts
        git pull
        cd /opt/semosshome/semoss-artifacts/artifacts/home && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/home/semoss*/* /opt/semosshome
        cd /opt/semosshome/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/web/semoss*/* /opt/apache-tomcat-8.0.41/webapps/SemossWeb
        cd /opt/semosshome/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/war/monolith*/* /opt/apache-tomcat-8.0.41/webapps/Monolith
        cd /opt/semosshome/semoss-artifacts/artifacts/lib && mvn clean install -Dci.version=$version
        cp -r /opt/semosshome/semoss-artifacts/artifacts/lib/monolith*/* /opt/apache-tomcat-8.0.41/webapps/Monolith
                             cp -r /opt/semosshome/semoss-artifacts/x/RDF_Map.prop /opt/semosshome 
                             cp -r /opt/semosshome/semoss-artifacts/x/web.xml /opt/apache-tomcat-8.0.41/webapps/Monolith/WEB-INF 
        echo "version=$latest_version" > /opt/semosshome/semoss-artifacts/ver.txt
else
        echo "Semoss is already upto date"
fi
