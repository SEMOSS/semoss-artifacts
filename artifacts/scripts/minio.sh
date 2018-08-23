#!/bin/bash
minio gateway azure &
sleep 7
mc config host add az http://127.0.0.1:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
rm -rf /opt/semosshome/*
mc cp --recursive az/${MINIO_DEFAULT_REMOTE}/ /opt/semosshome
mc mb az/${MINIO_REMOTE}
mc mirror --watch --overwrite /opt/semosshome az/${MINIO_REMOTE} &

# For scheduled reverse syncs
crontab -l > /opt/tempcron
echo "* * * * * mc mirror az/${MINIO_REMOTE} /opt/semosshome &" >> /opt/tempcron
crontab /opt/tempcron
rm /opt/tempcron
sleep 3