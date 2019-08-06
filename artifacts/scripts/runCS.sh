cd /opt/apache-tomcat-8.0.41/bin
./stop.sh
cd /opt/semoss-artifacts/artifacts/scripts
#./update_latest_dev.sh
if [ "$SECURITY_ON" = "true" ]
then sh setSecurityOn.sh
fi
if [ "$REMOTE_SECURITY" = "true" ]
then sh setRemoteSecurity.sh
fi
if [ "$REMOTE_LOCALMASTER" = "true" ]
then sh setRemoteLocalMaster.sh
fi
if [ "$REMOTE_THEMES" = "true" ]
then sh setRemoteLocalMaster.sh
fi
if [ "$AZCONN" = "true" ]
then sh setAzureProps.sh
fi
if [ "$SEMOSS_STORAGE_PROVIDER" = "AZURE" ]
then sh setAzureProps.sh
fi
if [ "$SETSOCIAL" = "true" ]
then sh setSocialProps.sh
fi
if [ "$SET_APPCONSTANTS" = "true" ]
then sh setAppConstants.sh
fi
if [ "$RSERVE_ON" = "true" ]
then sh setRserveOn.sh
fi
if [[ -z "${MONOLITH_COOKIE}" ]]; then
sh setMonolithCookie.sh
fi
if [ "$CUSTOM_MONOLITH_COOKIE" = "true" ]
then sh setMonolithCookie.sh
fi
sh setR.sh
cd /opt/apache-tomcat-8.0.41/bin
./start.sh
