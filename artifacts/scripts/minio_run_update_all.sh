cd /opt/semoss-artifacts
# Because chmod looks like a chage to git
git checkout .
git pull
chmod 777 /opt/semoss-artifacts/artifacts/scripts/*
minio.sh
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev.sh
mc mirror --watch --force --remove /opt/semosshome az/${MINIO_REMOTE} &
sleep 7
cd /opt/apache-tomcat-8.0.41/bin
./catalina.sh run
