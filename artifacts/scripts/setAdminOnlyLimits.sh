if [[ -z $ADMIN_ONLY_PROJECT_ADD ]]; then
echo "No admin only project add flag"
else sed -i "s@ADMIN_ONLY_PROJECT_ADD.*@ADMIN_ONLY_PROJECT_ADD\t$ADMIN_ONLY_PROJECT_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_PROJECT_DELETE ]]; then 
echo "No admin only project delete flag"
else sed -i "s@ADMIN_ONLY_PROJECT_DELETE.*@ADMIN_ONLY_PROJECT_DELETE\t$ADMIN_ONLY_PROJECT_DELETE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_PROJECT_ADD_ACCESS ]]; then 
echo "No admin only project add access flag"
else sed -i "s@ADMIN_ONLY_PROJECT_ADD_ACCESS.*@ADMIN_ONLY_PROJECT_ADD_ACCESS\t$ADMIN_ONLY_PROJECT_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_PROJECT_SET_PUBLIC ]]; then
echo "No admin only project set public flag"
else sed -i "s@ADMIN_ONLY_PROJECT_SET_PUBLIC.*@ADMIN_ONLY_PROJECT_SET_PUBLIC\t$ADMIN_ONLY_PROJECT_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_PROJECT_SET_DISCOVERABLE ]]; then
echo "No admin only project set discoverable flag"
else sed -i "s@ADMIN_ONLY_PROJECT_SET_DISCOVERABLE.*@ADMIN_ONLY_PROJECT_SET_DISCOVERABLE\t$ADMIN_ONLY_PROJECT_SET_DISCOVERABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_INSIGHT_SET_PUBLIC ]]; then
echo "No admin only insight set public flag"
else sed -i "s@ADMIN_ONLY_INSIGHT_SET_PUBLIC.*@ADMIN_ONLY_INSIGHT_SET_PUBLIC\t$ADMIN_ONLY_INSIGHT_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_INSIGHT_ADD_ACCESS ]]; then
echo "No admin only insight add access flag"
else sed -i "s@ADMIN_ONLY_INSIGHT_ADD_ACCESS.*@ADMIN_ONLY_INSIGHT_ADD_ACCESS\t$ADMIN_ONLY_INSIGHT_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_INSIGHT_SHARE ]]; then
echo "No admin only insight share flag"
else sed -i "s@ADMIN_ONLY_INSIGHT_SHARE.*@ADMIN_ONLY_INSIGHT_SHARE\t$ADMIN_ONLY_INSIGHT_SHARE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_DB_ADD ]]; then
echo "No admin only db add flag"
else sed -i "s@ADMIN_ONLY_DB_ADD.*@ADMIN_ONLY_DB_ADD\t$ADMIN_ONLY_DB_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_DB_DELETE ]]; then 
echo "No admin only db delete flag"
else sed -i "s@ADMIN_ONLY_DB_DELETE.*@ADMIN_ONLY_DB_DELETE\t$ADMIN_ONLY_DB_DELETE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_DB_ADD_ACCESS ]]; then 
echo "No admin only db add access flag"
else sed -i "s@ADMIN_ONLY_DB_ADD_ACCESS.*@ADMIN_ONLY_DB_ADD_ACCESS\t$ADMIN_ONLY_DB_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_DB_SET_PUBLIC ]]; then
echo "No admin only db set public flag"
else sed -i "s@ADMIN_ONLY_DB_SET_PUBLIC.*@ADMIN_ONLY_DB_SET_PUBLIC\t$ADMIN_ONLY_DB_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_DB_SET_DISCOVERABLE ]]; then
echo "No admin only db set discoverable flag"
else sed -i "s@ADMIN_ONLY_DB_SET_DISCOVERABLE.*@ADMIN_ONLY_DB_SET_DISCOVERABLE\t$ADMIN_ONLY_DB_SET_DISCOVERABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_MODEL_ADD ]]; then
echo "No admin only model add flag"
else sed -i "s@ADMIN_ONLY_MODEL_ADD.*@ADMIN_ONLY_MODEL_ADD\t$ADMIN_ONLY_MODEL_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_MODEL_DELETE ]]; then 
echo "No admin only model delete flag"
else sed -i "s@ADMIN_ONLY_MODEL_DELETE.*@ADMIN_ONLY_MODEL_DELETE\t$ADMIN_ONLY_MODEL_DELETE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_MODEL_ADD_ACCESS ]]; then 
echo "No admin only model add access flag"
else sed -i "s@ADMIN_ONLY_MODEL_ADD_ACCESS.*@ADMIN_ONLY_MODEL_ADD_ACCESS\t$ADMIN_ONLY_MODEL_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_MODEL_SET_PUBLIC ]]; then
echo "No admin only model set public flag"
else sed -i "s@ADMIN_ONLY_MODEL_SET_PUBLIC.*@ADMIN_ONLY_MODEL_SET_PUBLIC\t$ADMIN_ONLY_MODEL_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_MODEL_SET_DISCOVERABLE ]]; then
echo "No admin only model set discoverable flag"
else sed -i "s@ADMIN_ONLY_MODEL_SET_DISCOVERABLE.*@ADMIN_ONLY_MODEL_SET_DISCOVERABLE\t$ADMIN_ONLY_MODEL_SET_DISCOVERABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_STORAGE_ADD ]]; then
echo "No admin only storage add flag"
else sed -i "s@ADMIN_ONLY_STORAGE_ADD.*@ADMIN_ONLY_STORAGE_ADD\t$ADMIN_ONLY_STORAGE_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_STORAGE_DELETE ]]; then 
echo "No admin only storage delete flag"
else sed -i "s@ADMIN_ONLY_STORAGE_DELETE.*@ADMIN_ONLY_STORAGE_DELETE\t$ADMIN_ONLY_STORAGE_DELETE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_STORAGE_ADD_ACCESS ]]; then 
echo "No admin only storage add access flag"
else sed -i "s@ADMIN_ONLY_STORAGE_ADD_ACCESS.*@ADMIN_ONLY_STORAGE_ADD_ACCESS\t$ADMIN_ONLY_STORAGE_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_STORAGE_SET_PUBLIC ]]; then
echo "No admin only storage set public flag"
else sed -i "s@ADMIN_ONLY_STORAGE_SET_PUBLIC.*@ADMIN_ONLY_STORAGE_SET_PUBLIC\t$ADMIN_ONLY_STORAGE_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_STORAGE_SET_DISCOVERABLE ]]; then
echo "No admin only storage set discoverable flag"
else sed -i "s@ADMIN_ONLY_STORAGE_SET_DISCOVERABLE.*@ADMIN_ONLY_STORAGE_SET_DISCOVERABLE\t$ADMIN_ONLY_STORAGE_SET_DISCOVERABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_VECTOR_ADD ]]; then
echo "No admin only vector add flag"
else sed -i "s@ADMIN_ONLY_VECTOR_ADD.*@ADMIN_ONLY_VECTOR_ADD\t$ADMIN_ONLY_VECTOR_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_VECTOR_DELETE ]]; then 
echo "No admin only vector delete flag"
else sed -i "s@ADMIN_ONLY_VECTOR_DELETE.*@ADMIN_ONLY_VECTOR_DELETE\t$ADMIN_ONLY_VECTOR_DELETE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_VECTOR_ADD_ACCESS ]]; then 
echo "No admin only vector add access flag"
else sed -i "s@ADMIN_ONLY_VECTOR_ADD_ACCESS.*@ADMIN_ONLY_VECTOR_ADD_ACCESS\t$ADMIN_ONLY_VECTOR_ADD_ACCESS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_VECTOR_SET_PUBLIC ]]; then
echo "No admin only vector set public flag"
else sed -i "s@ADMIN_ONLY_VECTOR_SET_PUBLIC.*@ADMIN_ONLY_VECTOR_SET_PUBLIC\t$ADMIN_ONLY_VECTOR_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_VECTOR_SET_DISCOVERABLE ]]; then
echo "No admin only vector set discoverable flag"
else sed -i "s@ADMIN_ONLY_VECTOR_SET_DISCOVERABLE.*@ADMIN_ONLY_VECTOR_SET_DISCOVERABLE\t$ADMIN_ONLY_VECTOR_SET_DISCOVERABLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_FUNCTION_ADD ]]; then
echo "No admin only function add flag"
else sed -i "s@ADMIN_ONLY_FUNCTION_ADD.*@ADMIN_ONLY_FUNCTION_ADD\t$ADMIN_ONLY_FUNCTION_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_FUNCTION_ADD ]]; then 
echo "No admin only function delete flag"
else sed -i "s@ADMIN_ONLY_FUNCTION_ADD.*@ADMIN_ONLY_FUNCTION_ADD\t$ADMIN_ONLY_FUNCTION_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_FUNCTION_ADD ]]; then 
echo "No admin only function add access flag"
else sed -i "s@ADMIN_ONLY_FUNCTION_ADD.*@ADMIN_ONLY_FUNCTION_ADD\t$ADMIN_ONLY_FUNCTION_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_FUNCTION_ADD ]]; then
echo "No admin only function set public flag"
else sed -i "s@ADMIN_ONLY_FUNCTION_ADD.*@ADMIN_ONLY_FUNCTION_ADD\t$ADMIN_ONLY_FUNCTION_ADD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $ADMIN_ONLY_FUNCTION_ADD ]]; then
echo "No admin only function set discoverable flag"
else sed -i "s@ADMIN_ONLY_FUNCTION_ADD.*@ADMIN_ONLY_FUNCTION_ADD\t$ADMIN_ONLY_FUNCTION_ADD@g" /opt/semosshome/RDF_Map.prop
fi
