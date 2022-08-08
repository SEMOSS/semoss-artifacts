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

if [[ -z $ADMIN_ONLY_INSIGHT_SET_PUBLIC ]]; then
echo "No admin only insight set public flag"
else sed -i "s@ADMIN_ONLY_INSIGHT_SET_PUBLIC.*@ADMIN_ONLY_INSIGHT_SET_PUBLIC\t$ADMIN_ONLY_INSIGHT_SET_PUBLIC@g" /opt/semosshome/RDF_Map.prop
fi
