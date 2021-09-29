sed -i "s@NETTY_R.*@NETTY_R\t$NETTY_R@g" /opt/semosshome/RDF_Map.prop
if [[ -z "${TCP_WORKER}" ]];
then echo "No TCP_WORKER defined" 
else sed -i "s@TCP_WORKER.*@TCP_WORKER\t$TCP_WORKER@g" /opt/semosshome/RDF_Map.prop
fi
if [[ -z "${TCP_CLIENT}" ]];
then echo "No TCP_CLIENT defined" 
else sed -i "s@TCP_CLIENT.*@TCP_CLIENT\t$TCP_CLIENT@g" /opt/semosshome/RDF_Map.prop
fi
