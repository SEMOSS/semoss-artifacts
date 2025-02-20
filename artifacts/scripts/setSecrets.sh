if [[ -z "${SECRET_STORE_ENABLED}" ]];
then echo "No defined secret store enabled"
else
sed -i "s@SECRET_STORE_ENABLED.*@SECRET_STORE_ENABLED\t$SECRET_STORE_ENABLED@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRET_STORE_TYPE}" ]];
then echo "No defined secret store type"
else
sed -i "s@SECRET_STORE_TYPE.*@SECRET_STORE_TYPE\t$SECRET_STORE_TYPE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_DB_PATH}" ]];
then echo "No defined secret db path"
else
sed -i "s@SECRETS_DB_PATH.*@SECRETS_DB_PATH\t$SECRETS_DB_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_STORAGE_PATH}" ]];
then echo "No defined secret storage path"
else
sed -i "s@SECRETS_STORAGE_PATH.*@SECRETS_STORAGE_PATH\t$SECRETS_STORAGE_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_MODEL_PATH}" ]];
then echo "No defined secret model path"
else
sed -i "s@SECRETS_MODEL_PATH.*@SECRETS_MODEL_PATH\t$SECRETS_MODEL_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_VECTOR_PATH}" ]];
then echo "No defined secret vector path"
else
sed -i "s@SECRETS_VECTOR_PATH.*@SECRETS_VECTOR_PATH\t$SECRETS_VECTOR_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_FUNCTION_PATH}" ]];
then echo "No defined secret function path"
else
sed -i "s@SECRETS_FUNCTION_PATH.*@SECRETS_FUNCTION_PATH\t$SECRETS_FUNCTION_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_PROJECT_PATH}" ]];
then echo "No defined secret project path"
else
sed -i "s@SECRETS_PROJECT_PATH.*@SECRETS_PROJECT_PATH\t$SECRETS_PROJECT_PATH@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${SECRETS_VENV_PATH}" ]];
then echo "No defined secret venv path"
else
sed -i "s@SECRETS_VENV_PATH.*@SECRETS_VENV_PATH\t$SECRETS_VENV_PATH@g" /opt/semosshome/RDF_Map.prop
fi


if [[ -z "${VAULT_ADDR}" ]];
then echo "No defined vault addr"
else
sed -i "s@VAULT_ADDR.*@VAULT_ADDR\t$VAULT_ADDR@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${VAULT_TOKEN}" ]];
then echo "No defined vault token"
else
sed -i "s@VAULT_TOKEN.*@VAULT_TOKEN\t$VAULT_TOKEN@g" /opt/semosshome/RDF_Map.prop
fi


if [[ -z "${AZURE_AUTHENTICATE_MODE}" ]];
then echo "No defined azure authenticate mode"
else
sed -i "s@AZURE_AUTHENTICATE_MODE.*@AZURE_AUTHENTICATE_MODE\t$AZURE_AUTHENTICATE_MODE@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AZURE_KEYVAULT_NAME}" ]];
then echo "No defined azure keyvault name"
else
sed -i "s@AZURE_KEYVAULT_NAME.*@AZURE_KEYVAULT_NAME\t$AZURE_KEYVAULT_NAME@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AZURE_CLIENT_ID}" ]];
then echo "No defined azure client id"
else
sed -i "s@AZURE_CLIENT_ID.*@AZURE_CLIENT_ID\t$AZURE_CLIENT_ID@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AZURE_CLIENT_SECRET}" ]];
then echo "No defined azure client secret"
else
sed -i "s@AZURE_CLIENT_SECRET.*@AZURE_CLIENT_SECRET\t$AZURE_CLIENT_SECRET@g" /opt/semosshome/RDF_Map.prop
fi

if [[ -z "${AZURE_TENANT_ID}" ]];
then echo "No defined azure tenant id"
else
sed -i "s@AZURE_TENANT_ID.*@AZURE_TENANT_ID\t$AZURE_TENANT_ID@g" /opt/semosshome/RDF_Map.prop
fi