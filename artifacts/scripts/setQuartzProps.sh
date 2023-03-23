if [ -n "$THREADPOOL_CLASS" ]
then sed -i 's@<THREADPOOL_CLASS>@'"$THREADPOOL_CLASS"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$TREADPOOL_COUNT" ]
then sed -i 's@<THREADPOOL_COUNT>@'"$THREADPOOL_COUNT"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_CLASS" ]
then sed -i 's@<JOBSTORE_CLASS>@'"$JOBSTORE_CLASS"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_DRIVER" ]
then sed -i 's@<JOBSTORE_DRIVER>@'"$JOBSTORE_DRIVER"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_PREFIX" ]
then sed -i 's@<JOBSTORE_PREFIX>@'"$JOBSTORE_PREFIX"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_DATASOURCE" ]
then sed -i 's@<JOBSTORE_DATASOURCE>@'"$JOBSTORE_DATASOURCE"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_USEPROPERTIES" ]
then sed -i 's@<JOBSTORE_USEPROPERTIES>@'"$JOBSTORE_USEPROPERTIES"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$JOBSTORE_ISCLUSTERED" ]
then sed -i 's@<JOBSTORE_ISCLUSTERED>@'"$JOBSTORE_ISCLUSTERED"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_DRIVER" ]
then sed -i 's@<MYDS_DRIVER>@'"$MYDS_DRIVER"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_URL" ]
then sed -i 's@<MYDS_URL>@'"$MYDS_URL"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_USER" ]
then sed -i 's@<MYDS_USER>@'"$MYDS_USER"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_PASSWORD" ]
then sed -i 's@<MYDS_PASSWORD>@'"$MYDS_PASSWORD"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_CONNECTIONS" ]
then sed -i 's@<MYDS_CONNECTIONS>@'"$MYDS_CONNECTIONS"'@g' opt/semosshome/quartz.properties
fi

if [ -n "$MYDS_VALIDATION" ]
then sed -i 's@<MYDS_VALIDATION>@'"$MYDS_VALIDATION"'@g' opt/semosshome/quartz.properties
fi