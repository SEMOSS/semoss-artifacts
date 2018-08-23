minio.sh
mc mirror --watch --force --remove /opt/semosshome az/${MINIO_REMOTE} &
sleep 3
cd /opt/apache-tomcat-8.0.41/bin
./catalina.sh run