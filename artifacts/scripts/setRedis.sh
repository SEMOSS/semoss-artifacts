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

if [[ -z "${REDIS_SENTINEL_ENABLED}" ]];
then echo "No Redis sentinel enabled setting defined"
else
sed -i "s@REDIS_SENTINEL_ENABLED.*@REDIS_SENTINEL_ENABLED\t$REDIS_SENTINEL_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_MASTER_NAME}" ]];
then echo "No Redis master name defined"
else
sed -i "s@REDIS_MASTER_NAME.*@REDIS_MASTER_NAME\t$REDIS_MASTER_NAME@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_SENTINEL_NODES}" ]];
then echo "No Redis sentinel nodes defined"
else
sed -i "s@REDIS_SENTINEL_NODES.*@REDIS_SENTINEL_NODES\t$REDIS_SENTINEL_NODES@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_SENTINEL_PASSWORD}" ]];
then echo "No Redis sentinel password defined"
else
sed -i "s@REDIS_SENTINEL_PASSWORD.*@REDIS_SENTINEL_PASSWORD\t$REDIS_SENTINEL_PASSWORD@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_CLUSTER_ENABLED}" ]];
then echo "No Redis cluster enabled setting defined"
else
sed -i "s@REDIS_CLUSTER_ENABLED.*@REDIS_CLUSTER_ENABLED\t$REDIS_CLUSTER_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_CLUSTER_NODES}" ]];
then echo "No Redis cluster nodes defined"
else
sed -i "s@REDIS_CLUSTER_NODES.*@REDIS_CLUSTER_NODES\t$REDIS_CLUSTER_NODES@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${REDIS_CLUSTER_MAX_ATTEMPTS}" ]];
then echo "No Redis cluster max attempts defined"
else
sed -i "s@REDIS_CLUSTER_MAX_ATTEMPTS.*@REDIS_CLUSTER_MAX_ATTEMPTS\t$REDIS_CLUSTER_MAX_ATTEMPTS@g" /opt/semosshome/RDF_Map.prop
fi
