if [ -z "${M2_HOME}" ]; then
	SCRIPT_M2_HOME=/opt"$(ls /opt/ | grep "apache-maven")"
	echo "M2_HOME is $SCRIPT_M2_HOME"
        if [ -z "${SCRIPT_M2_HOME}" ]; then
                exit 1
        fi
else
	echo "M2_HOME is predefined at $M2_HOME"
	SCRIPT_M2_HOME="${M2_HOME}"
fi

sed  -i "s@<localRepository>/path/to/local/repo</localRepository>@--><localRepository>$CUSTOM_M2</localRepository><!--@g" $SCRIPT_M2_HOME/conf/settings.xml
sed -i '1s/^/REPO_HOME\t$CUSTOM_M2\n/' /opt/semosshome/RDF_Map.prop
