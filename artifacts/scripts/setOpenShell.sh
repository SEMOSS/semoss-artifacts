# OpenShell sandbox settings (SANDBOX_MODE OPENSHELL). Each env var has the name of the RDF_Map.prop
# key it sets. A key the template lacks is appended instead of silently ignored.
RDF_MAP=/opt/semosshome/RDF_Map.prop

set_openshell_prop() {
    local key="$1"
    local value="${!key}"
    if [[ -z "${value}" ]]; then
        return
    fi
    # & @ and \ are special in the sed replacement
    local escaped
    escaped=$(printf '%s' "$value" | sed -e 's/[\\&@]/\\&/g')
    if grep -q "^${key}\([[:space:]]\|\$\)" "$RDF_MAP"; then
        sed -i "s@^${key}\([[:space:]].*\)\?\$@${key}\t${escaped}@" "$RDF_MAP"
    else
        printf '%s\t%s\n' "$key" "$value" >> "$RDF_MAP"
    fi
}

# The registration below lives under the CLI's HOME, so tell the CLI to use that HOME.
if [[ -n "${OPENSHELL_CLIENT_URL}" && -z "${OPENSHELL_CLI_HOME}" ]]; then
    OPENSHELL_CLI_HOME=/opt/openshell-home
fi

for key in OPENSHELL_CLI OPENSHELL_CLI_HOME OPENSHELL_TEMPLATE OPENSHELL_IMAGE OPENSHELL_POLICY \
    OPENSHELL_PYTHON_BINARY OPENSHELL_EGRESS OPENSHELL_CPU OPENSHELL_MEMORY OPENSHELL_WORKER_PORT \
    OPENSHELL_LABEL OPENSHELL_READY_TIMEOUT_SECONDS OPENSHELL_KEEP_SANDBOX OPENSHELL_IDLE_EXIT_MINUTES \
    OPENSHELL_WORKER_MAX_CLIENTS; do
    set_openshell_prop "$key"
done

# Register a remote gateway (e.g. the sandbox cluster) for the openshell CLI: its registration and mTLS
# files live under $OPENSHELL_CLI_HOME/.config/openshell. Only when OPENSHELL_CLIENT_URL is set.
# These names avoid OPENSHELL_GATEWAY*, which the CLI itself reads from its environment
# (OPENSHELL_GATEWAY_ENDPOINT would bypass the registered gateway and its mTLS files).
if [[ -n "${OPENSHELL_CLIENT_URL}" ]]; then
    client_name="${OPENSHELL_CLIENT_NAME:-sandbox}"
    client_certs="${OPENSHELL_CLIENT_CERT_DIR:-/mnt/openshell-mtls}"
    client_dir="${OPENSHELL_CLI_HOME}/.config/openshell/gateways/${client_name}"
    mkdir -p "${client_dir}/mtls"
    if [[ -f "${client_certs}/ca.crt" && -f "${client_certs}/tls.crt" && -f "${client_certs}/tls.key" ]]; then
        cp "${client_certs}/ca.crt" "${client_certs}/tls.crt" "${client_certs}/tls.key" "${client_dir}/mtls/"
        chmod 600 "${client_dir}/mtls/tls.key"
    else
        echo "OpenShell client certs (ca.crt, tls.crt, tls.key) not found in ${client_certs}"
    fi
    printf '{"name":"%s","gateway_endpoint":"%s","is_remote":false,"gateway_port":0,"auth_mode":"mtls"}' \
        "${client_name}" "${OPENSHELL_CLIENT_URL}" > "${client_dir}/metadata.json"
    printf '%s' "${client_name}" > "${OPENSHELL_CLI_HOME}/.config/openshell/active_gateway"
fi
