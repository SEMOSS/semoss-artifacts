#!/bin/bash
# Assume the MINIO_REMOTE, MINIO_ACCESS_KEY, and MINIO_SECRET_KEY 
# environment variables are set

# The directory to mirror
directory=/opt/semosshome

# Setup the gateway
minio gateway azure &
sleep 3

# Add the host
mc config host add az http://127.0.0.1:9000 ${MINIO_ACCESS_KEY} ${MINIO_SECRET_KEY}
sleep 3

# If the remote exists, pull from it
# Else, make the bucket and push to it
if [[ "$(mc ls az)" = *"${MINIO_REMOTE}"* ]]; then
	echo initial pull
	mc mirror --overwrite az/${MINIO_REMOTE} ${directory}
else
	echo creating remote
	mc mb az/${MINIO_REMOTE}
	echo initial push
	mc mirror --overwrite ${directory} az/${MINIO_REMOTE}
fi
sleep 3

# Sync
while [[ true ]] ; do
	echo pull
	mc mirror --overwrite az/${MINIO_REMOTE} ${directory}
	sleep 3
	echo push
	mc mirror --overwrite ${directory} az/${MINIO_REMOTE}
	sleep 3
done
