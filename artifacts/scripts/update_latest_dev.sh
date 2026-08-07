#!/bin/bash

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


# FIPS 140-3 variant selection.
#
# Off by default, so existing builds are unchanged. Enable with the environment
# variable SEMOSS_FIPS=true or by passing --fips.
#
# The FIPS build of Monolith publishes the WEB-INF/lib payload under the
# "libraries-fips" classifier, with BouncyCastle omitted because the container
# supplies the validated bc-fips on the system classloader instead. The war is
# byte-identical between variants (it carries only semoss-<ver>*), so it is not
# republished and needs no classifier.
#
# Selecting the tomcat -fips base WITHOUT this would pull the standard tarball,
# putting an unvalidated BouncyCastle in WEB-INF/lib beside the validated
# bc-fips. That boots cleanly and is quietly non-compliant.
for arg in "$@"; do
	if [ "$arg" = "--fips" ]; then
		SEMOSS_FIPS=true
	fi
done

if [ "${SEMOSS_FIPS}" = "true" ]; then
	echo "FIPS mode: resolving the libraries-fips classifier"
	MONOLITH_CLASSIFIER_ARGS="-Dmonolith.lib.classifier=libraries-fips"
else
	MONOLITH_CLASSIFIER_ARGS=""
fi

latest_version=`curl -L -s "https://oss.sonatype.org/content/repositories/public/org/semoss/monolith/maven-metadata.xml" | grep "<latest>.*</latest>" | sed -e "s#\(.*\)\(<latest>\)\(.*\)\(</latest>\)\(.*\)#\3#g"`
last_updated=`curl -L -s "https://oss.sonatype.org/content/repositories/public/org/semoss/monolith/maven-metadata.xml" | grep "<lastUpdated>.*</lastUpdated>" | sed -e "s#\(.*\)\(<lastUpdated>\)\(.*\)\(</lastUpdated>\)\(.*\)#\3#g"`

if [ -f /opt/semoss-artifacts/ver.txt ]; then
        source /opt/semoss-artifacts/ver.txt
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
	rm -r /opt/semoss-artifacts/artifacts/home/semoss*
	rm -r /opt/semoss-artifacts/artifacts/home/target
        cd /opt/semoss-artifacts/artifacts/web && mvn clean install -Dci.version=$version
        cp -r /opt/semoss-artifacts/artifacts/web/semoss*/* $SCRIPT_TOMCAT_HOME/webapps/SemossWeb
	rm -r /opt/semoss-artifacts/artifacts/web/semoss*
	rm -r /opt/semoss-artifacts/artifacts/web/target
        cd /opt/semoss-artifacts/artifacts/war && mvn clean install -Dci.version=$version $MONOLITH_CLASSIFIER_ARGS
        cp -r /opt/semoss-artifacts/artifacts/war/monolith*/* $SCRIPT_TOMCAT_HOME/webapps/Monolith
	rm -r /opt/semoss-artifacts/artifacts/war/monolith*
	rm -r /opt/semoss-artifacts/artifacts/war/target
        cd /opt/semoss-artifacts/artifacts/lib && mvn clean install -Dci.version=$version $MONOLITH_CLASSIFIER_ARGS
        cp -r /opt/semoss-artifacts/artifacts/lib/monolith*/* $SCRIPT_TOMCAT_HOME/webapps/Monolith
	rm -r /opt/semoss-artifacts/artifacts/lib/monolith*
	rm -r /opt/semoss-artifacts/artifacts/lib/target
        cp -r /opt/semoss-artifacts/x/RDF_Map.prop /opt/semosshome
        cp -r /opt/semoss-artifacts/x/social.properties /opt/semosshome
        cp -r /opt/semoss-artifacts/x/log4j2.xml /opt/semosshome 
        cp -r /opt/semoss-artifacts/x/web.xml $SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF 

        echo "version=$latest_version" > /opt/semoss-artifacts/ver.txt
        echo "updated=$last_updated" >> /opt/semoss-artifacts/ver.txt
else
        echo "Semoss is already up to date"
fi
