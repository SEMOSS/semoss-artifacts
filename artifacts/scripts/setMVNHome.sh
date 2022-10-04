if [ -z "${MVN_HOME}" ]; then
	SCRIPT_MVN_HOME=/opt/"$(ls /opt/ | grep "apache-maven")"
	echo "MVN_HOME is $SCRIPT_MVN_HOME"
        if [ -z "${SCRIPT_MVN_HOME}" ]; then
                exit 1
        fi
else
	echo "MVN_HOME is predefined at $MVN_HOME"
	SCRIPT_MVN_HOME="${MVN_HOME}"
fi

sed -i '1s@^@MVN_HOME\t'"$MVN_HOME"'\n@' /opt/semosshome/RDF_Map.prop
