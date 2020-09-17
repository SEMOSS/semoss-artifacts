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
