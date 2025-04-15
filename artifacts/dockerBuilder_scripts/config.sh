os=$(uname)
if [[ $os == *Windows* ]] || [[ $os == Darwin ]]; then
    echo "Updating no link context.xml"
    cp context-no-link.xml $TOMCAT_HOME/conf/context.xml
else
    echo "Updating with link context.xml"
    cp context-with-link.xml $TOMCAT_HOME/conf/context.xml
fi