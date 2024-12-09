if [ "$PY_ON" = "true" ]
then sed -i "s@USE_PYTHON.*@USE_PYTHON\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$PY_ON" = "false" ]
then sed -i "s@USE_PYTHON.*@USE_PYTHON\tfalse@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$USE_FILE_PY" = "true" ]
then sed -i "s@USE_FILE_PY.*@USE_FILE_PY\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$USE_FILE_PY" = "false" ]
then sed -i "s@USE_FILE_PY.*@USE_FILE_PY\tfalse@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$USE_PY_FILE" = "true" ]
then sed -i "s@USE_PY_FILE.*@USE_PY_FILE\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$USE_PY_FILE" = "false" ]
then sed -i "s@USE_PY_FILE.*@USE_PY_FILE\tfalse@g" /opt/semosshome/RDF_Map.prop
fi


if [ "$USE_TCP_PY" = "true" ]
then sed -i "s@USE_TCP_PY.*@USE_PY_FILE\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$USE_TCP_PY" = "false" ]
then sed -i "s@USE_TCP_PY.*@USE_PY_FILE\tfalse@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${USERNAME_NATIVE_PY_SERVER}" ]];
then echo "No defined user for running native py server"
else
sed -i "s@USERNAME_NATIVE_PY_SERVER.*@USERNAME_NATIVE_PY_SERVER\t$USERNAME_NATIVE_PY_SERVER@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$NATIVE_PY_SERVER" = "true" ]
then sed -i "s@NATIVE_PY_SERVER.*@NATIVE_PY_SERVER\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$NATIVE_PY_SERVER" = "false" ]
then sed -i "s@NATIVE_PY_SERVER.*@NATIVE_PY_SERVER\tfalse@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${PY_SERVER_USER}" ]];
then echo "No defined user for running native py server"
else
sed -i "s@PY_SERVER_USER.*@PY_SERVER_USER\t$PY_SERVER_USER@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${PYTHONHOME_SITE_PACKAGES}" ]];
then echo "No specific python home site packages declared"
else
sed -i "s@PYTHONHOME_SITE_PACKAGES.*@PYTHONHOME_SITE_PACKAGES\t$PYTHONHOME_SITE_PACKAGES@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$DEFAULT_SCRIPTING_LANGUAGE" = "PY" ]
then sed -i "s:DEFAULT_SCRIPTING_LANGUAGE.*:DEFAULT_SCRIPTING_LANGUAGE\tPY:g" /opt/semosshome/RDF_Map.prop
fi
