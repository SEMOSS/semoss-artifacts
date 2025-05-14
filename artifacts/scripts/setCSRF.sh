#!/bin/bash
# Enable CSRF - activate using $ENABLE_CSRF true
sed -i '/<!--CSRF_FILTER_FLAG_START/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
sed -i '/CSRF_FILTER_FLAG_END-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
