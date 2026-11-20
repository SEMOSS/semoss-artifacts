# Sets the Monolith session cookie path in web.xml.
# Behind a rewritten prefix (/<app>/Monolith -> /Monolith) the cookie must be "/" or the browser never sends it back.
# MONOLITH_COOKIE_PATH set: write that path (replaces an existing one).
# Only FE_ROUTE set (prefixed deployment): add "/" when web.xml has no path yet; keep an existing path.
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

if sed -n '/<cookie-config>/,/<\/cookie-config>/p' "$WEB_XML" | grep -q "<path>"; then
	if [ -n "$MONOLITH_COOKIE_PATH" ]; then
		sed -i "/<cookie-config>/,/<\/cookie-config>/ s#<path>.*</path>#<path>$MONOLITH_COOKIE_PATH</path>#" "$WEB_XML"
		echo "Monolith cookie path set to $MONOLITH_COOKIE_PATH"
	else
		echo "Monolith cookie path already set in web.xml"
	fi
else
	COOKIE_PATH="${MONOLITH_COOKIE_PATH:-/}"
	sed -i "/<cookie-config>/,/<\/cookie-config>/ s#^\(\s*\)<name>.*</name>#&\n\1<path>$COOKIE_PATH</path>#" "$WEB_XML"
	echo "Monolith cookie path set to $COOKIE_PATH"
fi
