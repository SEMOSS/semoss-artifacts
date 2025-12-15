#!/bin/bash
if [ -n "$HEADER_SECURITY_DISABLED" ]; then
    sed -i "s|<!--HEADER_SECURITY_FILTER_FLAG_START-->|<!--HEADER_SECURITY_FILTER_FLAG_START|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
    sed -i "s|<!--HEADER_SECURITY_FILTER_FLAG_END-->| HEADER_SECURITY_FILTER_FLAG_END-->|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml

    sed -i "s|<!--HEADER_SECURITY_FILTER_FLAG_START-->|<!--HEADER_SECURITY_FILTER_FLAG_START|g" $TOMCAT_HOME/conf/web.xml
    sed -i "s|<!--HEADER_SECURITY_FILTER_FLAG_END-->| HEADER_SECURITY_FILTER_FLAG_END-->|g" $TOMCAT_HOME/conf/web.xml
fi

# Check if jacking option is defined
# Valid values should be: DENY, SAMEORIGIN, ALLOW-FROM
# https://tomcat.apache.org/tomcat-9.0-doc/config/filter.html#HTTP_Header_Security_Filter
if [ -n "$HEADER_SECURITY_JACKING_OPTION" ]; then
    sed -i "s|SAMEORIGIN|$HEADER_SECURITY_JACKING_OPTION|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
    sed -i "s|SAMEORIGIN|$HEADER_SECURITY_JACKING_OPTION|g" $TOMCAT_HOME/conf/web.xml
fi

# If domina is ALLOW-FROM - you likley want to define a URI to allow :)
if [ -n "$HEADER_SECURITY_JACKING_URI" ]; then
    sed -i '/<!--ANTI_CLICK_JACKING_URI_FLAG/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
    sed -i '/ANTI_CLICK_JACKING_URI_FLAG_END-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml

    sed -i '/<!--ANTI_CLICK_JACKING_URI_FLAG/d' $TOMCAT_HOME/conf/web.xml
    sed -i '/ANTI_CLICK_JACKING_URI_FLAG_END-->/d' $TOMCAT_HOME/conf/web.xml

    sed -i "s|HEADER_SECURITY_JACKING_URI|$HEADER_SECURITY_JACKING_URI|g" $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
    sed -i "s|HEADER_SECURITY_JACKING_URI|$HEADER_SECURITY_JACKING_URI|g" $TOMCAT_HOME/conf/web.xml
fi
