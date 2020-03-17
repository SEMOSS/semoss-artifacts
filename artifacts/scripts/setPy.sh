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
