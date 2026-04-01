#!/bin/bash
# Enable CSRF - activate using $ENABLE_CSRF true
if [[ "${ENABLE_CSRF}" == "true" ]]; then
    sed -i '/<!--CSRF_FILTER_FLAG_START/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
    sed -i '/CSRF_FILTER_FLAG_END-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
else
    echo "CSRF is not enabled, skipping..."
fi