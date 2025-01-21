sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_RDBMS_TYPE}" ]];
then
  echo "Custom Model Inference Logs Engine RDBMS Type is not defined"
else
  echo "Custom Model Inference Logs Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_MODEL_INFERENCE_LOGS_RDBMS_TYPE@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_DRIVER}" ]];
then
  echo "Custom Model Inference Logs Driver is not defined"
else
  echo "Custom Model Inference Logs Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_MODEL_INFERENCE_LOGS_DRIVER@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_DATABASE}" ]];
then
  echo "Custom Model Inference Logs Database is not defined"
else
  echo "Custom Model Inference Logs Database is defined"
  sed -i "s@DATABASE.*@DATABASE\t$CUSTOM_MODEL_INFERENCE_LOGS_DATABASE@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_SCHEMA}" ]];
then
  echo "Custom Model Inference Logs Schema is not defined"
else
  echo "Custom Model Inference Logs Schema is defined"
  sed -i "s@SCHEMA.*@SCHEMA\t$CUSTOM_MODEL_INFERENCE_LOGS_SCHEMA@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_USERNAME}" ]];
then
  echo "Custom Model Inference Logs USERNAME is not defined"
else
  echo "Custom Model Inference Logs USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_MODEL_INFERENCE_LOGS_USERNAME@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_PASSWORD}" ]];
then
  echo "Custom Model Inference Logs PASSWORD is not defined"
else
  echo "Custom Model Inference Logs PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_MODEL_INFERENCE_LOGS_PASSWORD@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_CONNECTION_URL}" ]];
then
  echo "Custom Model Inference Logs CONNECTION_URL is not defined"
else
  echo "Custom Model Inference Logs CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_MODEL_INFERENCE_LOGS_CONNECTION_URL@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_USE_CONNECTION_POOLING}" ]];
then
  echo "Custom Model Inference Logs USE_CONNECTION_POOLING is not defined"
else
  echo "Custom Model Inference Logs USE_CONNECTION_POOLING is defined"
  sed -i "s@USE_CONNECTION_POOLING.*@USE_CONNECTION_POOLING\t$CUSTOM_MODEL_INFERENCE_LOGS_USE_CONNECTION_POOLING@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_POOL_MIN_SIZE}" ]];
then
  echo "Custom Model Inference Logs POOL_MIN_SIZE is not defined"
else
  echo "Custom Model Inference Logs POOL_MIN_SIZE is defined"
  sed -i "s@POOL_MIN_SIZE.*@POOL_MIN_SIZE\t$CUSTOM_MODEL_INFERENCE_LOGS_POOL_MIN_SIZE@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_POOL_MAX_SIZE}" ]];
then
  echo "Custom Model Inference Logs POOL_MAX_SIZE is not defined"
else
  echo "Custom Model Inference Logs POOL_MAX_SIZE is defined"
  sed -i "s@POOL_MAX_SIZE.*@POOL_MAX_SIZE\t$CUSTOM_MODEL_INFERENCE_LOGS_POOL_MAX_SIZE@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi

if [[ -z "${CUSTOM_MODEL_INFERENCE_LOGS_AUTO_COMMIT}" ]];
then
  echo "Custom Model Inference Logs AUTO_COMMIT is not defined"
else
  echo "Custom Model Inference Logs AUTO_COMMIT is defined"
  sed -i "s@AUTO_COMMIT.*@AUTO_COMMIT\t$CUSTOM_MODEL_INFERENCE_LOGS_USE_AUTO_COMMIT@g" /opt/semosshome/db/ModelInferenceLogsDatabase.smss
fi
