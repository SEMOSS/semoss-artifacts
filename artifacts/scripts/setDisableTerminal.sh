if [[ -z "${DISABLE_TERMINAL}" ]];
then echo "No disable terminal -updated default value used"
else
sed -i "s@DISABLE_TERMINAL.*@DISABLE_TERMINAL\t$DISABLE_TERMINAL@g" /opt/semosshome/RDF_Map.prop
fi
