if [ "$PY_ON" = "true" ]
then sed -i "s@USE_PYTHON.*@USE_PYTHON\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$PY_ON" = "false" ]
then sed -i "s@USE_PYTHON.*@USE_PYTHON\tfalse@g" /opt/semosshome/RDF_Map.prop
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

if [[ -z "${SMSS_PYTHONHOME}" ]];
then echo "No specific pythonhome for rdf map declared"
else
sed -i "s#^\(PYTHONHOME\) .*#\1 $SMSS_PYTHONHOME#" /opt/semosshome/RDF_Map.prop
fi

if [ "$DEFAULT_SCRIPTING_LANGUAGE" = "PY" ]
then sed -i "s:DEFAULT_SCRIPTING_LANGUAGE.*:DEFAULT_SCRIPTING_LANGUAGE\tPY:g" /opt/semosshome/RDF_Map.prop
fi
