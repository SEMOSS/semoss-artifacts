cd /opt/semoss-artifacts
# Because chmod looks like a chage to git
git checkout .
git pull
chmod 777 /opt/semoss-artifacts/artifacts/scripts/*
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev.sh
cd /opt/apache-tomcat-8.0.41/bin
./catalina.sh run
