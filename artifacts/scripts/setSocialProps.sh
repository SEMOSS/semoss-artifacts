if [ -n "$REDIRECT" ]
then sed -i 's@<REDIRECT>@'"$REDIRECT"'@g' /opt/semosshome/social.properties 
fi

if [ -n "$ENABLE_NATIVE" ]
then sed -i "s@native_login.*@native_login\t$ENABLE_NATIVE@g" /opt/semosshome/social.properties
fi

if [ -n "$ENABLE_NATIVE_REGISTRATION" ]
then sed -i "s@native_registration.*@native_registration\t$ENABLE_NATIVE_REGISTRATION@g" /opt/semosshome/social.properties
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

if "$ENABLE_ADFS" = "true"
then sed -i "s/<ADFS_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if "$ENABLE_LINOTP" = "true"
then sed -i "s@linotp_login.*@linotp_login\t$ENABLE_LINOTP@g" /opt/semosshome/social.properties
fi

if "$ENABLE_LDAP" = "true"
then sed -i "s@ldap_login.*@ldap_login\t$ENABLE_LDAP@g" /opt/semosshome/social.properties
fi

if "$ENABLE_API_USER" = "true"
then sed -i "s@api_user_login.*@api_user_login\t$ENABLE_API_USER@g" /opt/semosshome/social.properties
fi

if [ -n "$API_USER_DYNAMIC" ]
then sed -i "s@api_user_require_dynamic_token.*@api_user_require_dynamic_token\t$API_USER_DYNAMIC@g" /opt/semosshome/social.properties
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




if [ -n "$LINOTP_HOSTNAME" ]
then sed -i "s@linotp_hostname.*@linotp_hostname\t$LINOTP_HOSTNAME@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_REALM" ]
then sed -i "s@linotp_realm.*@linotp_realm\t$LINOTP_REALM@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_AUTO_ADD" ]
then sed -i "s@linotp_auto_add.*@linotp_auto_add\t$LINOTP_AUTO_ADD@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_CHECK_AD" ]
then sed -i "s@linotp_check_ad.*@linotp_check_ad\t$LINOTP_CHECK_AD@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_MASTER_PRINCIPAL" ]
then sed -i "s@linotp_master_principal.*@linotp_master_principal\t$LINOTP_ADMIN_USER@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_MASTER_CREDENTIALS" ]
then sed -i "s@linotp_master_credentials.*@linotp_master_credentials\t$LINOTP_ADMIN_PASSWORD@g" /opt/semosshome/social.properties
fi



if [ -n "$LDAP_TYPE" ]
then sed -i "s@ldap_type.*@ldap_type\t$LDAP_TYPE@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_PROVIDER_URL" ]
then sed -i "s@ldap_provider_url.*@ldap_provider_url\t$LDAP_PROVIDER_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_PRINCIPAL_TEMPLATE" ]
then sed -i "s@ldap_principal_tempalte.*@ldap_principal_tempalte\t$LDAP_PRINCIPAL_TEMPLATE@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_KEY_ID" ]
then sed -i "s@ldap_key_id.*@ldap_key_id\t$LDAP_KEY_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_KEY_NAME" ]
then sed -i "s@ldap_key_name.*@ldap_key_name\t$LDAP_KEY_NAME@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_KEY_EMAIL" ]
then sed -i "s@ldap_key_email.*@ldap_key_email\t$LDAP_KEY_EMAIL@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_KEY_USERNAME" ]
then sed -i "s@ldap_key_username.*@ldap_key_username\t$LDAP_KEY_USERNAME@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_KEY_LAST_PWD_CHANGE" ]
then sed -i "s@ldap_key_last_pwd_change.*@ldap_key_last_pwd_change\t$LDAP_KEY_LAST_PWD_CHANGE@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_REQUIRE_PWD_CHANGE_DAYS" ]
then sed -i "s@ldap_require_pwd_change_days.*@ldap_require_pwd_change_days\t$LDAP_REQUIRE_PWD_CHANGE_DAYS@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_CHANGE" ]
then sed -i "s@ldap_use_custom_context_for_pwd_change.*@ldap_use_custom_context_for_pwd_change\t$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_CHANGE@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_USERNAME" ]
then sed -i "s@ldap_use_custom_context_for_pwd_username.*@ldap_use_custom_context_for_pwd_username\t$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_USERNAME@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_PASSWORD" ]
then sed -i "s@ldap_use_custom_context_for_pwd_password.*@ldap_use_custom_context_for_pwd_password\t$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_PASSWORD@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_SEARCH_CONTEXT_NAME" ]
then sed -i "s@ldap_search_context_name.*@ldap_search_context_name\t$LDAP_SEARCH_CONTEXT_NAME@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_SEARCH_CONTEXT_SCOPE" ]
then sed -i "s@ldap_search_context_scope.*@ldap_search_context_scope\t$LDAP_SEARCH_CONTEXT_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_SEARCH_MATCHING_ATTRIBUTES" ]
then sed -i "s@ldap_search_matching_attributes.*@ldap_search_matching_attributes\t$LDAP_SEARCH_MATCHING_ATTRIBUTES@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_AUTO_ADD" ]
then sed -i "s@ldap_auto_add.*@ldap_auto_add\t$LDAP_AUTO_ADD@g" /opt/semosshome/social.properties
fi





if [ -n "$SMTP_ENABLED" ]
then sed -i "s@<SMTPENABLED>@$SMTP_ENABLED@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_HOST" ]
then sed -i "s@<SMTPMAILHOST>@$SMTP_MAIL_HOST@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_PORT" ]
then sed -i "s@<SMTPMAILPORT>@$SMTP_MAIL_PORT@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_PORT" ]
then sed -i "s@<SMTPMAILSOCKETFACTORYPORT>@$SMTP_MAIL_SOCKETFACTORY_PORT@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_CLASS" ]
then sed -i "s@<SMTPMAILSOCKETFACTORYPORT>@$SMTP_MAIL_SOCKETFACTORY_CLASS@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_AUTH" ]
then sed -i "s@<SMTPMAILAUTH>@$SMTP_MAIL_AUTH@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_STARTTLS_ENABLE" ]
then sed -i "s@<SMTPMAILSTARTTLSENABLE>@$SMTP_MAIL_STARTTLS_ENABLE@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_USERNAME" ]
then sed -i "s@<SMTPUSERNAME>@$SMTP_USERNAME@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_PASSWORD" ]
then sed -i "s@<SMTPPASSWORD>@$SMTP_PASSWORD@g" /opt/semosshome/social.properties
fi

if [ -n "SMTP_SENDER" ]
then sed -i "s@<SMTPSENDER>@$SMTP_SENDER@g" /opt/semosshome/social.properties
fi
