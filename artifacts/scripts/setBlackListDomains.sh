if [[ -z "${BLACK_LIST_DOMAINS}" ]];
then echo "No defined black list domains"
else
sed -i "s@^BLACK_LIST_DOMAINS.*@BLACK_LIST_DOMAINS\t$BLACK_LIST_DOMAINS@g" /opt/semosshome/RDF_Map.prop
fi
