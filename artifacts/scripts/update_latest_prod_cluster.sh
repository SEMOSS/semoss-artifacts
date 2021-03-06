#!/bin/bash

latest_version=`curl -L -s "https://oss.sonatype.org/content/groups/public/org/semoss/semosscluster/maven-metadata.xml" | grep "<release>.*</release>" | sed -e "s#\(.*\)\(<release>\)\(.*\)\(</release>\)\(.*\)#\3#g"`
 
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
        rm -rf /opt/semoss-artifacts/artifacts/cluster/semoss*
        rm -rf /root/.m2/repository/org/semoss
        rm -f /opt/semosscluster.jar

        echo "Updating to version.. $version"
        cd /opt/semoss-artifacts/artifacts/cluster && mvn clean install -Dci.version=$version
        cd /opt/semoss-artifacts/artifacts/cluster/semosscluster-$version && jar cf ../semosscluster-$version.jar *
        cp /opt/semoss-artifacts/artifacts/cluster/semosscluster-$version.jar /opt/semosscluster.jar

        echo "version=$latest_version" > /opt/semoss-artifacts/ver.txt
        echo "updated=$last_updated" >> /opt/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
