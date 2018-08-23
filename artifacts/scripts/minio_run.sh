minio.sh
mc mirror --watch --force --remove /opt/semosshome az/${MINIO_REMOTE} &
sleep 7
cd /opt/apache-tomcat-8.0.41/bin
./catalina.sh run