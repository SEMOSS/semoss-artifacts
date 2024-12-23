if [ "$R_ON" = "true" ]
then sed -i "s@USE_R.*@USE_R\ttrue@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_ON" = "false" ]
then sed -i "s@USE_R.*@USE_R\tfalse@g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_CONNECTION_TYPE" = "JRI" ]
then sed -i "s:R_CONNECTION_JRI.*:R_CONNECTION_JRI\ttrue:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_CONNECTION_TYPE" = "Rserve" ]
then sed -i "s:R_CONNECTION_JRI.*:R_CONNECTION_JRI\tfalse:g" /opt/semosshome/RDF_Map.prop
sed -i "s:IS_USER_RSERVE.*:IS_USER_RSERVE\tfalse:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_CONNECTION_TYPE" = "User_Rserve_Pooled" ]
then sed -i "s:R_CONNECTION_JRI.*:R_CONNECTION_JRI\tfalse:g" /opt/semosshome/RDF_Map.prop
sed -i "s:IS_USER_RSERVE.*:IS_USER_RSERVE\ttrue:g" /opt/semosshome/RDF_Map.prop
sed -i "s:R_USER_CONNECTION_TYPE.*:R_USER_CONNECTION_TYPE\tpooled:g" /opt/semosshome/RDF_Map.prop
sed -i "s:RSERVE_CONNECTION_POOL_SIZE.*:RSERVE_CONNECTION_POOL_SIZE\t$R_POOL_SIZE:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_CONNECTION_TYPE" = "User_Rserve_Dedicated" ]
then sed -i "s:R_CONNECTION_JRI.*:R_CONNECTION_JRI\tfalse:g" /opt/semosshome/RDF_Map.prop
sed -i "s:IS_USER_RSERVE.*:IS_USER_RSERVE\ttrue:g" /opt/semosshome/RDF_Map.prop
sed -i "s:R_USER_CONNECTION_TYPE.*:R_USER_CONNECTION_TYPE\tdedicated:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_CONNECTION_TYPE" = "User_Rserve_Single" ]
then sed -i "s:R_CONNECTION_JRI.*:R_CONNECTION_JRI\tfalse:g" /opt/semosshome/RDF_Map.prop
sed -i "s:IS_USER_RSERVE.*:IS_USER_RSERVE\ttrue:g" /opt/semosshome/RDF_Map.prop
sed -i "s:R_USER_CONNECTION_TYPE.*:R_USER_CONNECTION_TYPE\tsingle:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_USER_RECOVERY" = "true" ]
then sed -i "s:R_USER_RECOVERY_DEFAULT.*:R_USER_RECOVERY_DEFAULT\ttrue:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$R_USER_RECOVERY" = "false" ]
then sed -i "s:R_USER_RECOVERY_DEFAULT.*:R_USER_RECOVERY_DEFAULT\tfalse:g" /opt/semosshome/RDF_Map.prop
fi

if [ "$DEFAULT_SCRIPTING_LANGUAGE" = "R" ]
then sed -i "s:DEFAULT_SCRIPTING_LANGUAGE.*:DEFAULT_SCRIPTING_LANGUAGE\tR:g" /opt/semosshome/RDF_Map.prop
fi

