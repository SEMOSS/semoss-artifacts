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
then set_prop native_login "$ENABLE_NATIVE"
fi

if [ -n "$ENABLE_NATIVE_REGISTRATION" ]
then set_prop native_registration "$ENABLE_NATIVE_REGISTRATION"
fi

if [ -n "$ENABLE_NATIVE_ACCESS_KEY_ALLOWED" ]
then set_prop native_access_keys_allowed "$ENABLE_NATIVE_ACCESS_KEY_ALLOWED"
fi

if [ -n "$NATIVE_DISPLAY_NAME" ]
then set_prop native_display_name "$NATIVE_DISPLAY_NAME"
fi

##### API USER Properties
if [ "$ENABLE_API_USER" = "true" ]
then set_prop api_user_login "$ENABLE_API_USER"
fi

if [ -n "$API_USER_DISPLAY_NAME" ]
then set_prop api_user_display_name "$API_USER_DISPLAY_NAME"
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
# OKTA_JSON, MS_GROUP_URL). Provider-specific keys (dropbox_role,
# ms_authority/tenant, ms_graphapi_*, servicenow_instance_url,
# siteminder_tenant) are handled in the custom blocks below; non-OAuth logins
# (native, api_user, cac, saml, windows_user, linotp, ldap, smtp) are handled
# separately above/below and are intentionally left out of the loop.
##### =====================================================================

OAUTH_PROVIDERS="adfs dropbox forgerock generic github gitlab google jira keycloak linkedin ms okta salesforce servicenow siteminder surveymonkey twitter"

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

##### Dropbox-specific Properties (outside the OAuth loop)
if [ -n "$DROPBOX_ROLE" ]
then set_prop dropbox_role "$DROPBOX_ROLE"
fi

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

if [ -n "$MS_GRAPHAPI_SCOPE" ]
then set_prop ms_graphapi_scope "$MS_GRAPHAPI_SCOPE"
fi

if [ -n "$MS_GRAPHAPI_GROUP_ID" ]
then set_prop ms_graphapi_groupId "$MS_GRAPHAPI_GROUP_ID"
fi

if [ -n "$MS_GRAPHAPI_JSON_PATTERN" ]
then set_prop ms_graphapi_jsonPattern "$MS_GRAPHAPI_JSON_PATTERN"
fi

##### ServiceNow-specific Properties (outside the OAuth loop)
if [ -n "$SERVICENOW_INSTANCE_URL" ]
then set_prop servicenow_instance_url "$SERVICENOW_INSTANCE_URL"
fi

##### Siteminder-specific Properties (outside the OAuth loop)
if [ -n "$SITEMINDER_TENANT" ]
then set_prop siteminder_tenant "$SITEMINDER_TENANT"
fi

##### CAC, SAML and Windows user Properties
# login toggle via ENABLE_{CAC|SAML|WINDOWS_USER}=true, button name via {..}_DISPLAY_NAME
for provider in cac saml windows_user
do
	PU=$(echo "$provider" | tr '[:lower:]' '[:upper:]')
	eval "enable_val=\${ENABLE_${PU}}"
	if [ "$enable_val" = "true" ]
	then set_prop "${provider}_login" true
	fi
	eval "val=\${${PU}_DISPLAY_NAME}"
	if [ -n "$val" ]
	then set_prop "${provider}_display_name" "$val"
	fi
done

# SAML_{FIELD} lists the assertion attribute names that build the field, joined with +
for field in id name email username groups provider
do
	FU=$(echo "$field" | tr '[:lower:]' '[:upper:]')
	eval "val=\${SAML_${FU}}"
	if [ -n "$val" ]
	then set_prop "saml_${field}" "$val"
	fi
done

##### LinOTP Properties
if [ "$ENABLE_LINOTP" = "true" ]
then set_prop linotp_login "$ENABLE_LINOTP"
fi

if [ -n "$LINOTP_HOSTNAME" ]
then set_prop linotp_hostname "$LINOTP_HOSTNAME"
fi

if [ -n "$LINOTP_REALM" ]
then set_prop linotp_realm "$LINOTP_REALM"
fi

if [ -n "$LINOTP_AUTO_ADD" ]
then set_prop linotp_auto_add "$LINOTP_AUTO_ADD"
fi

if [ -n "$LINOTP_CHECK_AD" ]
then set_prop linotp_check_ad "$LINOTP_CHECK_AD"
fi

if [ -n "$LINOTP_ADMIN_USER" ]
then set_prop linotp_adminuser "$LINOTP_ADMIN_USER"
fi

if [ -n "$LINOTP_ADMIN_PASSWORD" ]
then set_prop linotp_adminpassword "$LINOTP_ADMIN_PASSWORD"
fi

if [ -n "$LINOTP_ACCESS_KEY_ALLOWED" ]
then set_prop linotp_access_keys_allowed "$LINOTP_ACCESS_KEY_ALLOWED"
fi

if [ -n "$LINOTP_DISPLAY_NAME" ]
then set_prop linotp_display_name "$LINOTP_DISPLAY_NAME"
fi

##### LDAP Properties
if [ "$ENABLE_LDAP" = "true" ]
then set_prop ldap_login "$ENABLE_LDAP"
fi

if [ -n "$LDAP_TYPE" ]
then set_prop ldap_type "$LDAP_TYPE"
fi


if [ -n "$LDAP_MASTER_PRINCIPAL" ]
then set_prop ldap_master_principal "$LDAP_MASTER_PRINCIPAL"
fi

if [ -n "$LDAP_MASTER_CREDENTIALS" ]
then set_prop ldap_master_credentials "$LDAP_MASTER_CREDENTIALS"
fi


if [ -n "$LDAP_PRINCIPAL_TEMPLATE" ]
then set_prop ldap_principal_template "$LDAP_PRINCIPAL_TEMPLATE"
fi


if [ -n "$LDAP_PROVIDER_URL" ]
then set_prop ldap_provider_url "$LDAP_PROVIDER_URL"
fi

if [ -n "$LDAP_KEY_ID" ]
then set_prop ldap_key_id "$LDAP_KEY_ID"
fi

if [ -n "$LDAP_KEY_NAME" ]
then set_prop ldap_key_name "$LDAP_KEY_NAME"
fi

if [ -n "$LDAP_KEY_EMAIL" ]
then set_prop ldap_key_email "$LDAP_KEY_EMAIL"
fi

if [ -n "$LDAP_KEY_USERNAME" ]
then set_prop ldap_key_username "$LDAP_KEY_USERNAME"
fi

if [ -n "$LDAP_KEY_LAST_PWD_CHANGE" ]
then set_prop ldap_key_last_pwd_change "$LDAP_KEY_LAST_PWD_CHANGE"
fi

if [ -n "$LDAP_REQUIRE_PWD_CHANGE_DAYS" ]
then set_prop ldap_require_pwd_change_days "$LDAP_REQUIRE_PWD_CHANGE_DAYS"
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_CHANGE" ]
then set_prop ldap_use_custom_context_for_pwd_change "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_CHANGE"
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_USERNAME" ]
then set_prop ldap_use_custom_context_for_pwd_username "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_USERNAME"
fi

if [ -n "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_PASSWORD" ]
then set_prop ldap_use_custom_context_for_pwd_password "$LDAP_USE_CUSTOM_CONTEXT_FOR_PWD_PASSWORD"
fi

if [ -n "$LDAP_SEARCH_CONTEXT_NAME" ]
then set_prop ldap_search_context_name "$LDAP_SEARCH_CONTEXT_NAME"
fi

if [ -n "$LDAP_SEARCH_CONTEXT_SCOPE" ]
then set_prop ldap_search_context_scope "$LDAP_SEARCH_CONTEXT_SCOPE"
fi

if [ -n "$LDAP_SEARCH_MATCHING_ATTRIBUTES" ]
then set_prop ldap_search_matching_attributes "$LDAP_SEARCH_MATCHING_ATTRIBUTES"
fi

if [ -n "$LDAP_AUTO_ADD" ]
then set_prop ldap_auto_add "$LDAP_AUTO_ADD"
fi

if [ -n "$LDAP_ACCESS_KEY_ALLOWED" ]
then set_prop ldap_access_keys_allowed "$LDAP_ACCESS_KEY_ALLOWED"
fi

if [ -n "$LDAP_DISPLAY_NAME" ]
then set_prop ldap_display_name "$LDAP_DISPLAY_NAME"
fi

##### SMTP
if [ -n "$SMTP_ENABLED" ]
then set_prop smtp_enabled "$SMTP_ENABLED"
fi

if [ -n "$SMTP_MAIL_HOST" ]
then set_prop smtp_mail.smtp.host "$SMTP_MAIL_HOST"
fi

if [ -n "$SMTP_MAIL_PORT" ]
then set_prop smtp_mail.smtp.port "$SMTP_MAIL_PORT"
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_PORT" ]
then set_prop smtp_mail.smtp.socketFactory.port "$SMTP_MAIL_SOCKETFACTORY_PORT"
fi

if [ -n "$SMTP_MAIL_SOCKETFACTORY_CLASS" ]
then set_prop smtp_mail.smtp.socketFactory.class "$SMTP_MAIL_SOCKETFACTORY_CLASS"
fi

if [ -n "$SMTP_MAIL_AUTH" ]
then set_prop smtp_mail.smtp.auth "$SMTP_MAIL_AUTH"
fi

if [ -n "$SMTP_MAIL_STARTTLS_ENABLE" ]
then set_prop smtp_mail.smtp.starttls.enable "$SMTP_MAIL_STARTTLS_ENABLE"
fi

if [ -n "$SMTP_USERNAME" ]
then set_prop smtp_username "$SMTP_USERNAME"
fi

if [ -n "$SMTP_PASSWORD" ]
then set_prop smtp_password "$SMTP_PASSWORD"
fi

if [ -n "$SMTP_SENDER" ]
then set_prop smtp_sender "$SMTP_SENDER"
fi
