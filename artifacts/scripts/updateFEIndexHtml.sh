if [[ -z "${FE_ROUTE}" ]]; then 
    echo "No custom route exist" 
    # Loop through all folders in packages directory
    for package_dir in $TOMCAT_HOME/webapps/SemossWeb/packages/*/; do
        if [[ -d "$package_dir" && -f "$package_dir/dist/index.html" && "$(basename "$package_dir")" != "legacy" ]]; then
            echo "Processing $(basename "$package_dir")"
            sed -i "/<head>/a\        <script id=\"semoss-env\" type=\"application/json\">{\"MODULE\":\"Monolith\"}</script>" "$package_dir/dist/index.html"
        fi
    done
else 
    # Loop through all folders in packages directory
    for package_dir in $TOMCAT_HOME/webapps/SemossWeb/packages/*/; do
        if [[ -d "$package_dir" && -f "$package_dir/dist/index.html" && "$(basename "$package_dir")" != "legacy" ]]; then
            echo "Processing $(basename "$package_dir")"
            sed -i "/<head>/a\        <script id=\"semoss-env\" type=\"application/json\">{\"MODULE\":\"$FE_ROUTE\"}</script>" "$package_dir/dist/index.html"
        fi
    done
fi