if [ -n "$REDIRECT" ]
then sed -i 's@<REDIRECT>@'"$REDIRECT"'@g' /opt/semosshome/social.properties 
fi
 
if "$ENABLE_NATIVE" = "true"
then sed -i "s/<NATIVE_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_GOOGLE" = "true"
then sed -i "s/<GOOGLE_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_GITHUB" = "true"
then sed -i "s/<GITHUB_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_DROPBOX" = "true"
then sed -i "s/<DROPBOX_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_MS" = "true"
then sed -i "s/<MS_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_CLIENT_ID" ]
then sed -i "s/<GOOGLECLIENTID>/$GOOGLE_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_SECRET_KEY" ]
then sed -i "s/<GOOGLESECRETKEY>/$GOOGLE_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_REDIRECT" ]
then sed -i 's@<GOOGLEREDIRECT>@'"$GOOGLE_REDIRECT"'@g' /opt/semosshome/social.properties
fi

if [ -n "$GIT_CLIENT_ID" ]
then sed -i "s/<GITCLIENTID>/$GIT_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$GIT_SECRET_KEY" ]
then sed -i "s/<GITSECRETKEY>/$GIT_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$GIT_REDIRECT" ]
then sed -i 's@<GITREDIRECT>@'"$GIT_REDIRECT"'@g' /opt/semosshome/social.properties
fi

if [ -n "$MS_AUTHORITY" ]
then sed -i "s/<MSAUTHORITY>/$MS_AUTHORITY/g" /opt/semosshome/social.properties
fi

if [ -n "$MS_TENANT" ]
then sed -i "s/<MSTENANT>/$MS_TENANT/g" /opt/semosshome/social.properties
fi

if [ -n "$MS_CLIENT_ID" ]
then sed -i "s/<MSCLIENTID>/$MS_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$MS_SECRET_KEY" ]
then sed -i "s/<MSSECRETKEY>/$MS_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$MS_REDIRECT" ]
then sed -i "s/<MSREDIRECT>/$MS_REDIRECT/g" /opt/semosshome/social.properties
fi
