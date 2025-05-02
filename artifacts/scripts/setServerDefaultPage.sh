# if you want to direct directly to our auth endpoints
# you will set CUSTOM_DEFAULT_PAGE to Monolith/login
# and you will then set the CUSTOM_DEFAULT_PAGE_URL to https://YOUR_DNS/Monolith/api/auth/<your provider>

if [ -n "$CUSTOM_DEFAULT_PAGE" ]; then
    sed -i 's|docBase="SemossWeb"|docBase='"\"$CUSTOM_DEFAULT_PAGE"\"'|g' $TOMCAT_HOME/conf/server.xml
fi

if [ -n "$CUSTOM_DEFAULT_PAGE_URL" ]; then
    sed -i "s|http://www.google.com|$CUSTOM_DEFAULT_PAGE_URL|g" $TOMCAT_HOME/webapps/Monolith/login/index.html
fi
