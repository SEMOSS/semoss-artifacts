if [[ -z "${REDIS_ENABLED}" ]];
then echo "No Redis enabled setting defined"
else
sed -i "s@REDIS_ENABLED.*@REDIS_ENABLED\t$REDIS_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_HOST}" ]];
then echo "No Redis host defined"
else
sed -i "s@REDIS_HOST.*@REDIS_HOST\t$REDIS_HOST@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_PORT}" ]];
then echo "No Redis port defined"
else
sed -i "s@REDIS_PORT.*@REDIS_PORT\t$REDIS_PORT@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_PASSWORD}" ]];
then echo "No Redis password defined"
else
sed -i "s@REDIS_PASSWORD.*@REDIS_PASSWORD\t$REDIS_PASSWORD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_TIMEOUT_MS}" ]];
then echo "No Redis timeout defined"
else
sed -i "s@REDIS_TIMEOUT_MS.*@REDIS_TIMEOUT_MS\t$REDIS_TIMEOUT_MS@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_POOL_MAX_TOTAL}" ]];
then echo "No Redis pool max total defined"
else
sed -i "s@REDIS_POOL_MAX_TOTAL.*@REDIS_POOL_MAX_TOTAL\t$REDIS_POOL_MAX_TOTAL@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_POOL_MAX_IDLE}" ]];
then echo "No Redis pool max idle defined"
else
sed -i "s@REDIS_POOL_MAX_IDLE.*@REDIS_POOL_MAX_IDLE\t$REDIS_POOL_MAX_IDLE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_POOL_MIN_IDLE}" ]];
then echo "No Redis pool min idle defined"
else
sed -i "s@REDIS_POOL_MIN_IDLE.*@REDIS_POOL_MIN_IDLE\t$REDIS_POOL_MIN_IDLE@g" /opt/semosshome/RDF_Map.prop
fi
