cd /opt/semoss-artifacts
git pull
cd /opt/semoss-artifacts/artifacts/scripts
./update_latest_dev_no_lib.sh
cd /opt/apache-tomcat-8.0.41/bin
./catalina.sh run
