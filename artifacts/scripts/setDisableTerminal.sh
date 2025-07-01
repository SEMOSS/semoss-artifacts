if [[ -z "${DISABLE_TERMINAL}" ]];
then echo "No disable terminal -updated default value used"
else
sed -i "s@DISABLE_TERMINAL.*@DISABLE_TERMINAL\t$DISABLE_TERMINAL@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${DISABLE_R_TERMINAL}" ]];
then echo "No disable R terminal -updated default value used"
else
sed -i "s@DISABLE_R_TERMINAL.*@DISABLE_R_TERMINAL\t$DISABLE_R_TERMINAL@g" /opt/semosshome/RDF_Map.prop
fi


if [[ -z "${DISABLE_PY_TERMINAL}" ]];
then echo "No disable Py terminal -updated default value used"
else
sed -i "s@DISABLE_PY_TERMINAL.*@DISABLE_PY_TERMINAL\t$DISABLE_PY_TERMINAL@g" /opt/semosshome/RDF_Map.prop
fi


if [[ -z "${DISABLE_GIT_TERMINAL}" ]];
then echo "No disable git terminal -updated default value used"
else
sed -i "s@DISABLE_GIT_TERMINAL.*@DISABLE_GIT_TERMINAL\t$DISABLE_GIT_TERMINAL@g" /opt/semosshome/RDF_Map.prop
fi
