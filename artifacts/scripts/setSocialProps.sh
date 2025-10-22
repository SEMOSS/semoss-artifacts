##### Redirect
if [ -n "$REDIRECT" ]
then sed -i 's@<REDIRECT>@'"$REDIRECT"'@g' /opt/semosshome/social.properties 
fi

##### NATIVE Properties
if [ -n "$ENABLE_NATIVE" ]
then sed -i "s@native_login.*@native_login\t$ENABLE_NATIVE@g" /opt/semosshome/social.properties
fi

if [ -n "$ENABLE_NATIVE_REGISTRATION" ]
then sed -i "s@native_registration.*@native_registration\t$ENABLE_NATIVE_REGISTRATION@g" /opt/semosshome/social.properties
fi

if [ -n "$ENABLE_NATIVE_ACCESS_KEY_ALLOWED" ]
then sed -i "s@native_access_keys_allowed.*@native_access_keys_allowed\t$ENABLE_NATIVE_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$NATIVE_DISPLAY_NAME" ]
then sed -i "s@native_display_name.*@native_display_name\t$NATIVE_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### API USER Properties
if [ "$ENABLE_API_USER" = "true" ]
then sed -i "s@api_user_login.*@api_user_login\t$ENABLE_API_USER@g" /opt/semosshome/social.properties
fi

if [ -n "$API_USER_DYNAMIC" ]
then sed -i "s@api_user_require_dynamic_token.*@api_user_require_dynamic_token\t$API_USER_DYNAMIC@g" /opt/semosshome/social.properties
fi

if [ -n "$API_USER_DISPLAY_NAME" ]
then sed -i "s@api_user_display_name.*@api_user_display_name\t$API_USER_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### For Providers - Enable Login True
if [ "$ENABLE_GOOGLE" = "true" ]
then sed -i "s/<GOOGLE_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_GITHUB" = "true" ]
then sed -i "s/<GITHUB_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_DROPBOX" = "true" ]
then sed -i "s/<DROPBOX_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_MS" = "true" ]
then sed -i "s/<MS_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_SITEMINDER" = "true" ]
then sed -i "s/<SITEMINDER_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_ADFS" = "true" ]
then sed -i "s/<ADFS_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_OKTA" = "true" ]
then sed -i "s/<OKTA_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_GENERIC" = "true" ]
then sed -i "s/<GENERIC_ENABLE>/true/g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_LINOTP" = "true" ]
then sed -i "s@linotp_login.*@linotp_login\t$ENABLE_LINOTP@g" /opt/semosshome/social.properties
fi

if [ "$ENABLE_LDAP" = "true" ]
then sed -i "s@ldap_login.*@ldap_login\t$ENABLE_LDAP@g" /opt/semosshome/social.properties
fi


##### Google Properties
if [ -n "$GOOGLE_CLIENT_ID" ]
then sed -i "s/<GOOGLECLIENTID>/$GOOGLE_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_SECRET_KEY" ]
then sed -i "s/<GOOGLESECRETKEY>/$GOOGLE_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_REDIRECT" ]
then sed -i 's@<GOOGLEREDIRECT>@'"$GOOGLE_REDIRECT"'@g' /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_ACCESS_KEY_ALLOWED" ]
then sed -i "s@google_access_keys_allowed.*@google_access_keys_allowed\t$GOOGLE_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$GOOGLE_DISPLAY_NAME" ]
then sed -i "s@google_display_name.*@google_display_name\t$GOOGLE_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### Github Properties
if [ -n "$GITHUB_CLIENT_ID" ]
then sed -i "s/<GITHUBCLIENTID>/$GITHUB_CLIENT_ID/g" /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_SECRET_KEY" ]
then sed -i "s/<GITHUBSECRETKEY>/$GITHUB_SECRET_KEY/g" /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_REDIRECT" ]
then sed -i 's@<GITHUBREDIRECT>@'"$GITHUB_REDIRECT"'@g' /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_ACCESS_KEY_ALLOWED" ]
then sed -i "s@github_access_keys_allowed.*@github_access_keys_allowed\t$GITHUB_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$GITHUB_DISPLAY_NAME" ]
then sed -i "s@github_display_name.*@github_display_name\t$GITHUB_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### MS Properties
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

if [ -n "$MS_ACCESS_KEY_ALLOWED" ]
then sed -i "s@ms_access_keys_allowed.*@ms_access_keys_allowed\t$MS_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_LOGIN_EXTERNAL" ]
then sed -i "s@ms_login_external.*@ms_login_external\t$MS_LOGIN_EXTERNAL@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_SCOPE" ]
then sed -i "s@ms_scope.*@ms_scope\t$MS_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_LOOKUP" ]
then sed -i "s@ms_graphapi_lookup.*@ms_graphapi_lookup\t$MS_GRAPHAPI_LOOKUP@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_APPLICATION_CREDENTIALS" ]
then sed -i "s@ms_graphapi_application_credentials.*@ms_graphapi_application_credentials\t$MS_GRAPHAPI_APPLICATION_CREDENTIALS@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_CLIENT_ID" ]
then sed -i "s@ms_graphapi_client_id.*@ms_graphapi_client_id\t$MS_GRAPHAPI_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_SECRET_KEY" ]
then sed -i "s@ms_graphapi_secret_key.*@ms_graphapi_secret_key\t$MS_GRAPHAPI_SECRET_KEY@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_GROUP_ID" ]
then sed -i "s@ms_graphapi_groupId.*@ms_graphapi_groupId\t$MS_GRAPHAPI_GROUP_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_GRAPHAPI_JSON_PATTERN" ]
then sed -i "s@ms_graphapi_jsonPattern.*@ms_graphapi_jsonPattern\t$MS_GRAPHAPI_JSON_PATTERN@g" /opt/semosshome/social.properties
fi

if [ -n "$MS_DISPLAY_NAME" ]
then sed -i "s@ms_display_name.*@ms_display_name\t$MS_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### Siteminder Properties
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

if [ -n "$SITEMINDER_ACCESS_KEY_ALLOWED" ]
then sed -i "s@siteminder_access_keys_allowed@siteminder_access_keys_allowed\t$SITEMINDER_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$SITEMINDER_DISPLAY_NAME" ]
then sed -i "s@siteminder_display_name.*@siteminder_display_name\t$SITEMINDER_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### ADFS Properties
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

if [ -n "$ADFS_ACCESS_KEY_ALLOWED" ]
then sed -i "s@adfs_access_keys_allowed@adfs_access_keys_allowed\t$ADFS_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$ADFS_DISPLAY_NAME" ]
then sed -i "s@adfs_display_name.*@adfs_display_name\t$ADFS_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi


##### Okta Properties
if [ -n "$OKTA_CLIENT_ID" ]
then sed -i "s@okta_client_id.*@okta_client_id\t$OKTA_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_SECRET_KEY" ]
then sed -i "s@okta_secret_key.*@okta_secret_key\t$OKTA_SECRET_KEY@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_REDIRECT" ]
then sed -i "s@okta_redirect_uri.*@okta_redirect_uri\t$OKTA_REDIRECT@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_AUTH_URL" ]
then sed -i "s@okta_auth_url.*@okta_auth_url\t$OKTA_AUTH_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_TOKEN_URL" ]
then sed -i "s@okta_token_url.*@okta_token_url\t$OKTA_TOKEN_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_USERINFO_URL" ]
then sed -i "s@okta_userinfo_url.*@okta_userinfo_url\t$OKTA_USERINFO_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_SCOPE" ]
then sed -i "s@okta_scope.*@okta_scope\t$OKTA_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_ACCESS_KEY_ALLOWED" ]
then sed -i "s@okta_access_keys_allowed.*@okta_access_keys_allowed\t$OKTA_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_DISPLAY_NAME" ]
then sed -i "s@okta_display_name.*@okta_display_name\t$OKTA_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_JSON" ]
then sed -i "s@okta_jsonPattern.*@okta_jsonPattern\t$OKTA_JSON@g" /opt/semosshome/social.properties
fi

if [ -n "$OKTA_BEAN" ]
then sed -i "s@okta_beanProps.*@okta_beanProps\t$OKTA_BEAN@g" /opt/semosshome/social.properties
fi

##### Generic Properties
if [ -n "$GENERIC_CLIENT_ID" ]
then sed -i "s@<GENERICCLIENTID>@$GENERIC_CLIENT_ID@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_SECRET_KEY" ]
then sed -i "s#<GENERICSECRETKEY>#$GENERIC_SECRET_KEY#g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_REDIRECT" ]
then sed -i "s@<GENERICREDIRECT>@$GENERIC_REDIRECT@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_TOKEN_URL" ]
then sed -i "s@<GENERICTOKENURL>@$GENERIC_TOKEN_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_AUTH_URL" ]
then sed -i "s@<GENERICAUTHURL>@$GENERIC_AUTH_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_USERINFO_URL" ]
then sed -i "s@<GENERICUSERINFOURL>@$GENERIC_USERINFO_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_SCOPE" ]
then sed -i "s@<GENERICSCOPE>@$GENERIC_SCOPE@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_BEAN" ]
then sed -i "s@<GENERICBEAN>@$GENERIC_BEAN@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_JSON" ]
then sed -i "s@<GENERICJSON>@$GENERIC_JSON@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_AUTO_ADD" ]
then sed -i "s@generic_auto_add.*@generic_auto_add\t$GENERIC_AUTO_ADD@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_ACCESS_KEY_ALLOWED" ]
then sed -i "s@generic_access_keys_allowed.*@generic_access_keys_allowed\t$GENERIC_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_GROUPS" ]
then sed -i "s@generic_groups.*@generic_groups\t$GENERIC_GROUPS@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_GROUP_URL" ]
then sed -i "s@generic_group_url.*@generic_group_url\t$GENERIC_GROUP_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_GROUP_JSON_PATTERN" ]
then sed -i "s@generic_groupJsonPattern.*@generic_groupJsonPattern\t$GENERIC_GROUP_JSON_PATTERN@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_GROUP_STRING_RETURN" ]
then sed -i "s@generic_group_string_return.*@generic_group_string_return\t$GENERIC_GROUP_STRING_RETURN@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_GROUP_STRING_REGEX" ]
then sed -i "s@generic_group_string_regex.*@generic_group_string_regex\t$GENERIC_GROUP_STRING_REGEX@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_SANITIZE_USER_RESPONSE" ]
then sed -i "s@generic_sanitizeUserResponse.*@generic_sanitizeUserResponse\t$GENERIC_SANITIZE_USER_RESPONSE@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_SANITIZE_GROUP_RESPONSE" ]
then sed -i "s@generic_sanitizeGroupResponse.*@generic_sanitizeGroupResponse\t$GENERIC_SANITIZE_GROUP_RESPONSE@g" /opt/semosshome/social.properties
fi

if [ -n "$GENERIC_DISPLAY_NAME" ]
then sed -i "s@generic_display_name.*@generic_display_name\t$GENERIC_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### LinOTP Properties
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

if [ -n "$LINOTP_ADMIN_USER" ]
then sed -i "s@linotp_adminuser.*@linotp_adminuser\t$LINOTP_ADMIN_USER@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_ADMIN_PASSWORD" ]
then sed -i "s@linotp_adminpassword.*@linotp_adminpassword\t$LINOTP_ADMIN_PASSWORD@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_ACCESS_KEY_ALLOWED" ]
then sed -i "s@linotp_access_keys_allowed@linotp_access_keys_allowed\t$LINOTP_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$LINOTP_DISPLAY_NAME" ]
then sed -i "s@linotp_display_name.*@linotp_display_name\t$LINOTP_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### LDAP Properties
if [ -n "$LDAP_TYPE" ]
then sed -i "s@ldap_type.*@ldap_type\t$LDAP_TYPE@g" /opt/semosshome/social.properties
fi


if [ -n "$LDAP_MASTER_PRINCIPAL" ]
then sed -i "s@ldap_master_principal.*@ldap_master_principal\t$LDAP_MASTER_PRINCIPAL@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_MASTER_CREDENTIALS" ]
then sed -i "s@ldap_master_credentials.*@ldap_master_credentials\t$LDAP_MASTER_CREDENTIALS@g" /opt/semosshome/social.properties
fi


if [ -n "$LDAP_PRINCIPAL_TEMPLATE" ]
then sed -i "s@ldap_principal_template.*@ldap_principal_template\t$LDAP_PRINCIPAL_TEMPLATE@g" /opt/semosshome/social.properties
fi


if [ -n "$LDAP_PROVIDER_URL" ]
then sed -i "s@ldap_provider_url.*@ldap_provider_url\t$LDAP_PROVIDER_URL@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_PRINCIPAL_TEMPLATE" ]
then sed -i "s@ldap_principal_template.*@ldap_principal_template\t$LDAP_PRINCIPAL_TEMPLATE@g" /opt/semosshome/social.properties
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

if [ -n "$LDAP_ACCESS_KEY_ALLOWED" ]
then sed -i "s@ldap_access_keys_allowed@ldap_access_keys_allowed\t$LDAP_ACCESS_KEY_ALLOWED@g" /opt/semosshome/social.properties
fi

if [ -n "$LDAP_DISPLAY_NAME" ]
then sed -i "s@ldap_display_name.*@ldap_display_name\t$LDAP_DISPLAY_NAME@g" /opt/semosshome/social.properties
fi

##### SMTP
if [ -n "$SMTP_ENABLED" ]
then sed -i "s@smtp_enabled.*@smtp_enabled\t$SMTP_ENABLED@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_HOST" ]
then sed -i "s@smtp_mail.smtp.host.*@smtp_mail.smtp.host\t$SMTP_MAIL_HOST@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_PORT" ]
then sed -i "s@smtp_mail.smtp.port.*@smtp_mail.smtp.port\t$SMTP_MAIL_PORT@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_PORT" ]
then sed -i "s@smtp_mail.smtp.socketFactory.port.*@smtp_mail.smtp.socketFactory.port\t$SMTP_MAIL_SOCKETFACTORY_PORT@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_CLASS" ]
then sed -i "s@smtp_mail.smtp.socketFactory.class.*@smtp_mail.smtp.socketFactory.class\t$SMTP_MAIL_SOCKETFACTORY_CLASS@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_AUTH" ]
then sed -i "s@smtp_mail.smtp.auth.*@smtp_mail.smtp.auth\t$SMTP_MAIL_AUTH@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_MAIL_STARTTLS_ENABLE" ]
then sed -i "s@smtp_mail.smtp.starttls.enable.*@smtp_mail.smtp.starttls.enable\t$SMTP_MAIL_STARTTLS_ENABLE@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_USERNAME" ]
then sed -i "s@smtp_username.*@smtp_username\t$SMTP_USERNAME@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_PASSWORD" ]
then sed -i "s@smtp_password.*@smtp_password\t$SMTP_PASSWORD@g" /opt/semosshome/social.properties
fi

if [ -n "$SMTP_SENDER" ]
then sed -i "s|smtp_sender.*|smtp_sender\t$SMTP_SENDER|g" /opt/semosshome/social.properties
fi
