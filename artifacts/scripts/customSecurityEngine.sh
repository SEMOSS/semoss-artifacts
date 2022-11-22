sed -i "s/H2EmbeddedServerEngine/RDBMSNativeEngine/g" /opt/semosshome/db/security.smss

if [[ -z "${CUSTOM_SECURITY_RDBMS_TYPE}" ]];
then
  echo "Custom Security Engine RDBMS Type is not defined"
else
  echo "Custom Security Engine RDBMS Type is defined"
  sed -i "s@RDBMS_TYPE.*@RDBMS_TYPE\t$CUSTOM_SECURITY_RDBMS_TYPE@g" /opt/semosshome/db/security.smss
fi

if [[ -z "${CUSTOM_SECURITY_DRIVER}" ]];
then
  echo "Custom Security Driver is not defined"
else
  echo "Custom Security Driver is defined"
  sed -i "s@DRIVER.*@DRIVER\t$CUSTOM_SECURITY_DRIVER@g" /opt/semosshome/db/security.smss
fi

if [[ -z "${CUSTOM_SECURITY_USERNAME}" ]];
then
  echo "Custom Security USERNAME is not defined"
else
  echo "Custom Security USERNAME is defined"
  sed -i "s@USERNAME.*@USERNAME\t$CUSTOM_SECURITY_USERNAME@g" /opt/semosshome/db/security.smss
fi

if [[ -z "${CUSTOM_SECURITY_PASSWORD}" ]];
then
  echo "Custom Security PASSWORD is not defined"
else
  echo "Custom Security PASSWORD is defined"
  sed -i "s@PASSWORD.*@PASSWORD\t$CUSTOM_SECURITY_PASSWORD@g" /opt/semosshome/db/security.smss
fi

if [[ -z "${CUSTOM_SECURITY_CONNECTION_URL}" ]];
then
  echo "Custom Security CONNECTION_URL is not defined"
else
  echo "Custom Security CONNECTION_URL is defined"
  sed -i "s@CONNECTION_URL.*@CONNECTION_URL\t$CUSTOM_SECURITY_CONNECTION_URL@g" /opt/semosshome/db/security.smss
fi
