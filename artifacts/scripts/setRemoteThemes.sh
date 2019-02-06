sed -i "s/jdbc:h2:nio:@BaseFolder@\/db\/@ENGINE@\/databaseNewMaster/jdbc:h2:tcp:\/\/$REMOTE_THEMES_IP\/databaseNewMaster/g" /opt/semosshome/db/LocalMasterDatabase.smss
