# Sets the Monolith session cookie path in web.xml.
# Use "/" when Monolith is served under a rewritten prefix (e.g. /<app>/Monolith -> /Monolith), so the browser
# sends the session cookie back without a proxy cookie-path rewrite.
if [ -z "${TOMCAT_HOME}" ]; then
	SCRIPT_TOMCAT_HOME="/opt/$(ls /opt/ | grep -m1 "apache-tomcat")"
else
	SCRIPT_TOMCAT_HOME="${TOMCAT_HOME}"
fi
WEB_XML="$SCRIPT_TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml"
if [ ! -f "$WEB_XML" ]; then
	echo "web.xml not found at $WEB_XML"
	exit 1
fi

# replace an existing path, else add one after the cookie name
if sed -n '/<cookie-config>/,/<\/cookie-config>/p' "$WEB_XML" | grep -q "<path>"; then
	sed -i "/<cookie-config>/,/<\/cookie-config>/ s#<path>.*</path>#<path>$MONOLITH_COOKIE_PATH</path>#" "$WEB_XML"
else
	sed -i "/<cookie-config>/,/<\/cookie-config>/ s#^\(\s*\)<name>.*</name>#&\n\1<path>$MONOLITH_COOKIE_PATH</path>#" "$WEB_XML"
fi
echo "Monolith cookie path set to $MONOLITH_COOKIE_PATH"
