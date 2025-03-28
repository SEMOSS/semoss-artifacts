### DEPRECATED THROUGH setCors.sh

#!/bin/bash
sed -i '/<!--CORS_FILTER_FLAG/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i '/CORS_FILTER_FLAG_END-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
