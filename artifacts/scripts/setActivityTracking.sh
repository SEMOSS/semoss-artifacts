if [[ -z $USER_TRACKING_ENABLED ]]; then
echo "No user tracking enabled flag"
else sed -i "s@USER_TRACKING_ENABLED.*@USER_TRACKING_ENABLED\t$USER_TRACKING_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z $USER_TRACKING_METHOD ]]; then 
echo "No user tracking method"
else sed -i "s@USER_TRACKING_METHOD.*@USER_TRACKING_METHOD\t$USER_TRACKING_METHOD@g" /opt/semosshome/RDF_Map.prop
fi
