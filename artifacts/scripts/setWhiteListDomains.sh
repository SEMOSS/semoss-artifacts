if [ -n "$WHITE_LIST_DOMAINS" ]
then sed -i 's@<WHITE_LIST_DOMAINS>@'"$WHITE_LIST_DOMAINS"'@g' opt/semosshome/RDF_Map.prop
fi