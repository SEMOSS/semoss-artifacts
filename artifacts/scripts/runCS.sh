if [ "$SECURITY_ON" = "true" ]
then sh setSecurityOn.sh
fi
if [ "$REMOTE_SECURITY" = "true" ]
then sh setRemoteSecurity.sh
fi
if [ "$REMOTE_LOCALMASTER" = "true" ]
then sh setRemoteLocalMaster.sh
fi
if [ "$AZCONN" = "true" ]
then sh setAzureProps.sh
fi
if [ "$SETSOCIAL" = "true" ]
then sh setSocialProps.sh
fi
if [ "$SET_APPCONSTANTS" = "true" ]
then sh setAppConstants.sh
fi
cd /opt/apache-tomcat-8.0.41/bin
./stop.sh
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev_no_lib.sh
cd /opt/apache-tomcat-8.0.41/bin
./start.sh
