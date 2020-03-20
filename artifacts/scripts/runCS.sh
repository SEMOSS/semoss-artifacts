if [ -z "${TOMCAT_HOME}" ]; then
        if [ -d "/opt/apache-tomcat-8.0.41" ] 
        then 
                echo "Directory /opt/apache-tomcat-8.0.41 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-8.0.41
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        elif [ -d "/opt/apache-tomcat-9.0.26" ] 
        then
                echo "Directory /opt/apache-tomcat-9.0.26 exists."
                SCRIPT_TOMCAT_HOME=/opt/apache-tomcat-9.0.26
                echo "TOMCAT_HOME is $SCRIPT_TOMCAT_HOME"
        else 
                echo "No Tomcat installation has been found"
        fi
else
        echo "TOMCAT_HOME is predefined at $TOMCAT_HOME"
        SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi


cd $SCRIPT_TOMCAT_HOME/bin
./stop.sh
cd /opt/semoss-artifacts/artifacts/scripts
#./update_latest_dev.sh
if [ "$SECURITY_ON" = "true" ]
then sh setSecurityOn.sh
fi
if [ "$ANONYMOUS_USERS" = "true" ]
then sh enableAnonymousUsers.sh
fi
if [ "$ANONYMOUS_USER_UPLOAD" = "true" ]
then sh enableAnonymousUserUpload.sh
fi
if [ "$REMOTE_SECURITY" = "true" ]
then sh setRemoteSecurity.sh
fi
if [ "$REMOTE_LOCALMASTER" = "true" ]
then sh setRemoteLocalMaster.sh
fi
if [ "$REMOTE_THEMES" = "true" ]
then sh setRemoteThemes.sh
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
echo "No Custom Monolith Cookie"
else sh setMonolithCookie.sh
fi
if [ "$CUSTOM_MONOLITH_COOKIE" = "true" ]
then sh setMonolithCookie.sh
fi
if [[ -z "${FILE_UPLOAD_LIMIT}" ]];
then echo "No updated file size limit" 
else sh setFileUploadLimit.sh
fi
if [[ -z "${R_MEM_LIMIT}" ]];
then echo "No updated r memory limit" 
else sh setRMemLimit.sh
fi
if [[ -z "${DEFAULT_FRAME_TYPE}" ]];
then echo "No updated default frame" 
else sh setDefaultFrame.sh
fi
if [[ -z "${FRAME_SIZE_LIMIT}" ]];
then echo "No updated frame size limit" 
else sh setFrameLimit.sh
fi
if [[ -z "${GOOGLE_ANALYTICS_ID}" ]];
then echo "No custom google analytics id" 
else sh setGoogleAnalytics.sh
fi
if [ "$T_ON" = "false" ]
then sh setTOn.sh
fi
if [ "$X_CACHE" = "true" ]
then sh setXCacheOn.sh
fi
sh setR.sh
sh setPy.sh
cd $SCRIPT_TOMCAT_HOME/bin
./start.sh
