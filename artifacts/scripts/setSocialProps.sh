if [ -n "$REDIRECT" ]
then sed -i 's@<REDIRECT>@'"$REDIRECT"'@g' /opt/semosshome/social.properties 
fi

if "$ENABLE_NATIVE" = "true"
then sed -i "s/<NATIVE_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_NATIVE_REGISTRATION" = "true"
then sed -i "s/<NATIVE_REGISTRATION_ENABLE>/true/g" /opt/semosshome/social.properties
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

if "$ENABLE_SITEMINDER" = "true"
then sed -i "s/<SITEMINDER_ENABLE>/true/g" /opt/semosshome/social.properties
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

if [ -n "$GITHUB_CLIENT_ID" ]
then sed -i "s/<GITHUBCLIENTID>/$GITHUB_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_SECRET_KEY" ]
then sed -i "s/<GITHUBSECRETKEY>/$GITHUB_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_REDIRECT" ]
then sed -i 's@<GITHUBREDIRECT>@'"$GITHUB_REDIRECT"'@g' /opt/semosshome/social.properties
fi

if [ -n "$MS_AUTHORITY" ]
then sed -i "s@<MSAUTHORITY>@$MS_AUTHORITY@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_TENANT" ]
then sed -i "s@<MSTENANT>@$MS_TENANT@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_CLIENT_ID" ]
then sed -i "s@<MSCLIENTID>@$MS_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_SECRET_KEY" ]
then sed -i "s#<MSSECRETKEY>#$MS_SECRET_KEY#g" /opt/semosshome/social.properties
fi

if [ -n "$MS_REDIRECT" ]
then sed -i "s@<MSREDIRECT>@$MS_REDIRECT@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_TOKEN_URL" ]
then sed -i "s@ms_token_url@ms_token_url\t$MS_TOKEN_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_AUTH_URL" ]
then sed -i "s@ms_auth_url@ms_auth_url\t$MS_AUTH_URL@g" /opt/semosshome/social.properties
fi


if [ -n "$SITEMINDER_TENANT" ]
then sed -i "s@<SITEMINDERTENANT>@$SITEMINDER_TENANT@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_CLIENT_ID" ]
then sed -i "s@<SITEMINDERCLIENTID>@$SITEMINDER_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_SECRET_KEY" ]
then sed -i "s#<SITEMINDERSECRETKEY>#$SITEMINDER_SECRET_KEY#g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_REDIRECT" ]
then sed -i "s@<SITEMINDERREDIRECT>@$SITEMINDER_REDIRECT@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_SCOPE" ]
then sed -i "s@<SITEMINDERSCOPE>@$SITEMINDER_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_SCOPE" ]
then sed -i "s@<SITEMINDERSCOPE>@$SITEMINDER_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_TOKEN_URL" ]
then sed -i "s@siteminder_token_url@siteminder_token_url\t$SITEMINDER_TOKEN_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_AUTH_URL" ]
then sed -i "s@siteminder_auth_url@siteminder_auth_url\t$SITEMINDER_AUTH_URL@g" /opt/semosshome/social.properties
fi






if [ -n "$ADFS_CLIENT_ID" ]
then sed -i "s@<ADFSCLIENTID>@$ADFS_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_SECRET_KEY" ]
then sed -i "s#<ADFSSECRETKEY>#$ADFS_SECRET_KEY#g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_REDIRECT" ]
then sed -i "s@<ADFSREDIRECT>@$ADFS_REDIRECT@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_TOKEN_URL" ]
then sed -i "s@<ADFSTOKENURL>@$ADFS_TOKEN_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_AUTH_URL" ]
then sed -i "s@<ADFSAUTHURL>@$ADFS_AUTH_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_SCOPE" ]
then sed -i "s@<ADFSSCOPE>@$ADFS_SCOPE@g" /opt/semosshome/social.properties
fi


if [ -n "$ADFS_BEAN" ]
then sed -i "s@<ADFSBEAN>@$ADFS_BEAN@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_JSON" ]
then sed -i "s@<ADFSJSON>@$ADFS_JSON@g" /opt/semosshome/social.properties
fi

