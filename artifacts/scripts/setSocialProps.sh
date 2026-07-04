# Rewrite a "<key>\t<value>" line, escaping sed replacement metacharacters
# (\ & |) so secrets/URLs/scopes containing them are set verbatim.
set_prop() {
	key="$1"
	value="$2"
	esc=$(printf '%s' "$value" | sed -e 's/[\\&|]/\\&/g')
	sed -i "s|^${key}[[:space:]].*|${key}\t${esc}|g;s|^${key}\$|${key}\t${esc}|g" /opt/semosshome/social.properties
}

##### Redirect
if [ -n "$REDIRECT" ]
then set_prop redirect "$REDIRECT"
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

##### =====================================================================
##### OAuth / SSO providers - unified loop
#
# Every OAuth provider shares the same set of social.properties keys, so they
# are all filled by one loop instead of a copy/pasted block per provider.
#
#   * To add a provider: add its prefix to OAUTH_PROVIDERS and add a matching
#     key block to x/social.properties.
#   * To add a shared key: add one "ENV_SUFFIX:propKey" pair to OAUTH_KEYS.
#
# Env vars are read as ${PROVIDER}_${ENV_SUFFIX} (e.g. GOOGLE_CLIENT_ID,
# OKTA_JSON, MS_GROUP_URL). Provider-specific keys (ms_authority/tenant,
# ms_graphapi_*, siteminder_tenant) are handled in the custom blocks below;
# non-OAuth logins (native, api_user, linotp, ldap, smtp) are handled
# separately above/below and are intentionally left out of the loop.
##### =====================================================================

OAUTH_PROVIDERS="adfs dropbox generic github google ms okta siteminder"

# <ENV_VAR_SUFFIX>:<social.properties key suffix>
OAUTH_KEYS="CLIENT_ID:client_id \
SECRET_KEY:secret_key \
REDIRECT:redirect_uri \
AUTH_URL:auth_url \
TOKEN_URL:token_url \
USERINFO_URL:userinfo_url \
SCOPE:scope \
JSON:jsonPattern \
BEAN:beanProps \
AUTO_ADD:auto_add \
ACCESS_KEY_ALLOWED:access_keys_allowed \
DISPLAY_NAME:display_name \
GROUPS:groups \
GROUP_URL:group_url \
GROUP_JSON_PATTERN:groupJsonPattern \
GROUP_STRING_RETURN:group_string_return \
GROUP_STRING_REGEX:group_string_regex \
SANITIZE_USER_RESPONSE:sanitizeUserResponse \
SANITIZE_GROUP_RESPONSE:sanitizeGroupResponse"

for provider in $OAUTH_PROVIDERS
do
	PU=$(echo "$provider" | tr '[:lower:]' '[:upper:]')

	# enable flag: {provider}_login defaults to false; flip to true when ENABLE_{PROVIDER}=true
	eval "enable_val=\${ENABLE_${PU}}"
	if [ "$enable_val" = "true" ]
	then set_prop "${provider}_login" true
	fi

	# shared OAuth keys
	for pair in $OAUTH_KEYS
	do
		env_suffix=${pair%%:*}
		prop_key=${pair#*:}
		eval "val=\${${PU}_${env_suffix}}"
		if [ -n "$val" ]
		then set_prop "${provider}_${prop_key}" "$val"
		fi
	done
done

##### MS-specific Properties (outside the OAuth loop)
if [ -n "$MS_AUTHORITY" ]
then set_prop ms_authority "$MS_AUTHORITY"
fi

if [ -n "$MS_TENANT" ]
then set_prop ms_tenant "$MS_TENANT"
fi

if [ -n "$MS_LOGIN_EXTERNAL" ]
then set_prop ms_login_external "$MS_LOGIN_EXTERNAL"
fi

if [ -n "$MS_GRAPHAPI_LOOKUP" ]
then set_prop ms_graphapi_lookup "$MS_GRAPHAPI_LOOKUP"
fi

if [ -n "$MS_GRAPHAPI_APPLICATION_CREDENTIALS" ]
then set_prop ms_graphapi_application_credentials "$MS_GRAPHAPI_APPLICATION_CREDENTIALS"
fi

if [ -n "$MS_GRAPHAPI_CLIENT_ID" ]
then set_prop ms_graphapi_client_id "$MS_GRAPHAPI_CLIENT_ID"
fi

if [ -n "$MS_GRAPHAPI_SECRET_KEY" ]
then set_prop ms_graphapi_secret_key "$MS_GRAPHAPI_SECRET_KEY"
fi

if [ -n "$MS_GRAPHAPI_GROUP_ID" ]
then set_prop ms_graphapi_groupId "$MS_GRAPHAPI_GROUP_ID"
fi

if [ -n "$MS_GRAPHAPI_JSON_PATTERN" ]
then set_prop ms_graphapi_jsonPattern "$MS_GRAPHAPI_JSON_PATTERN"
fi

##### Siteminder-specific Properties (outside the OAuth loop)
if [ -n "$SITEMINDER_TENANT" ]
then set_prop siteminder_tenant "$SITEMINDER_TENANT"
fi

##### LinOTP Properties
if [ "$ENABLE_LINOTP" = "true" ]
then sed -i "s@linotp_login.*@linotp_login\t$ENABLE_LINOTP@g" /opt/semosshome/social.properties
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
if [ "$ENABLE_LDAP" = "true" ]
then sed -i "s@ldap_login.*@ldap_login\t$ENABLE_LDAP@g" /opt/semosshome/social.properties
fi

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
