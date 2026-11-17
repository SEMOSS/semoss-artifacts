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

for key in OPENSHELL_CLI OPENSHELL_CLI_HOME OPENSHELL_TEMPLATE OPENSHELL_IMAGE OPENSHELL_POLICY \
    OPENSHELL_PYTHON_BINARY OPENSHELL_EGRESS OPENSHELL_CPU OPENSHELL_MEMORY OPENSHELL_WORKER_PORT \
    OPENSHELL_LABEL OPENSHELL_READY_TIMEOUT_SECONDS OPENSHELL_KEEP_SANDBOX OPENSHELL_IDLE_EXIT_MINUTES \
    OPENSHELL_WORKER_MAX_CLIENTS; do
    set_openshell_prop "$key"
done
