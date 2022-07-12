#master branch
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
if [ "$ENCRYPT_SMSS" = "true" ]; then
echo "Encoding SMSS files"
sh setEncryptSmss.sh
else 
echo "No encoding for SMSS files"
fi
if [ "$ANONYMOUS_USERS" = "true" ]
then sh enableAnonymousUsers.sh
fi
if [ "$ANONYMOUS_USER_UPLOAD" = "true" ]
then sh enableAnonymousUserUpload.sh
fi
if [ "$REMOTE_SECURITY" = "true" ]
then bash setRemoteSecurity.sh
fi
if [ "$REMOTE_LOCALMASTER" = "true" ]
then bash setRemoteLocalMaster.sh
fi
if [ "$REMOTE_SCHEDULER" = "true" ]
then bash setRemoteScheduler.sh
fi
if [ "$REMOTE_THEMES" = "true" ]
then bash setRemoteThemes.sh
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
if [[ -z "${DEFAULT_FRAME_TYPE}" ]];
then echo "No updated default frame" 
else sh setDefaultFrame.sh
fi
if [[ -z "${DEFAULT_INSIGHT_CACHEABLE}" ]];
then echo "No updated default insight cacheable" 
else sh setDefaultInsightCacheable.sh
fi
if [[ -z "${SHARED_FILE_PATH}" ]];
then echo "No updated shared file path" 
else sh setSharedFilePath.sh
fi
if [[ -z "${FILE_UPLOAD_LIMIT}" ]];
then echo "No updated file size limit" 
else sh setFileUploadLimit.sh
fi
if [[ -z "${R_MEM_LIMIT}" ]];
then echo "No updated r memory limit" 
else sh setRMemLimit.sh
fi
if [[ -z "${FRAME_SIZE_LIMIT}" ]];
then echo "No updated frame size limit" 
else sh setFrameLimit.sh
fi
if [[ -z "${GOOGLE_ANALYTICS_ID}" ]];
then echo "No custom google analytics id" 
else sh setGoogleAnalytics.sh
fi
if [[ -z "${MONOLITH_ROUTE}" ]];
then echo "No custom monolith route" 
else sh setRouteCookie.sh
fi
if [ "$T_ON" = "false" ]
then sh setTOn.sh
fi
if [ "$X_CACHE" = "true" ]
then sh setXCacheOn.sh
fi
if [[ -z "${SCHEDULER_ENDPOINT}" ]];
then echo "No custom scheduler url defined" 
else sh setSchedulerUrl.sh
fi
if [[ -z "${PM_SEMOSS_EXECUTE_SQL_ENCRYPTION_PASSWORD}" ]];
then echo "No SQL Encryption Password" 
else sh setSQLEncryptionPassword.sh
fi
if [[ -z "${PIVOT_ROW_MAX}" ]];
then echo "No Custom Pivot Row Max Defined" 
else sh setPivotRowMax.sh
fi
if [[ -z "${PIVOT_COL_MAX}" ]];
then echo "No Custom Pivot Col Max Defined" 
else sh setPivotColMax.sh
fi
if [[ -z "${CORS_ALLOWED_ORIGINS}" ]];
then echo "No custom cors definitions" 
else sh setCorsOrigins.sh
fi
if [[ -z "${TRUSTED_TOKEN_DOMAIN}" ]];
then echo "No custom trusted token domain" 
else sh setTrustedTokenDomain.sh
fi
if [[ -z "${SESSION_TIMEOUT}" ]];
then echo "No custom session timeout" 
else sh setSessionTimeout.sh
fi
if [[ -z "${SESSION_LIMIT}" ]];
then echo "No custom session limit" 
else sh setSessionLimit.sh
fi
if [[ -z "${NETTY_R}" ]];
then echo "No netty r defined" 
else sh setNettyR.sh
fi
if [[ -z "${NETTY_PYTHON}" ]];
then echo "No netty python defined" 
else sh setNettyPython.sh
fi
if [[ -z "${ULIMIT_R_MEM_LIMIT}" ]];
then echo "No ulimit defined" 
else sh setUlimit.sh
fi
if [[ -z "${SHOW_WELCOME_BANNER}" ]];
then echo "No show welcome banner defined" 
else sh setShowWelcomeBanner.sh
fi
if [[ -z "${CHECK_MEM}" ]];
then echo "No check memory defined" 
else sh setMemoryFilterCheckMem.sh
fi
if [[ -z "${MEM_PROFILE_SETTINGS}" ]];
then echo "No mem profile settings defined" 
else sh setMemoryFilterMemProfileSettings.sh
fi
if [[ -z "${RESERVED_JAVA_MEM}" ]];
then echo "No reserved java mem  defined" 
else sh setMemoryFilterReservedJavaMem.sh
fi
if [[ -z "${USER_MEM_LIMIT}" ]];
then echo "No user mem limit defined" 
else sh setMemoryFilterUserMemLimit.sh
fi
bash setCacheProperties.sh
bash setAdminOnlyLimits.sh
sh setR.sh
sh setPy.sh
cd $SCRIPT_TOMCAT_HOME/bin
./start.sh
