if [[ -z "${FE_ROUTE}" ]]; then 
    echo "No custom route exist" 
    sed -i 's@<!doctype html><html lang="en" ng-app="app"><head>@<!doctype html><html lang="en" ng-app="app"><head><script id="semoss-env" type="application/json">{"MODULE":"Monolith"}</script>@g' $TOMCAT_HOME/webapps/SemossWeb/index.html
    sed -i 's@<!doctype html><html><head><meta charset=\"utf-8\"/>@<!doctype html><html><head><meta charset=\"utf-8\"/><script id="semoss-env" type="application/json">{"MODULE":"Monolith"}</script>@g' $TOMCAT_HOME/webapps/SemossWeb/packages/client/dist/index.html
else 
    #sed -i "s@<!doctype html><html lang=\"en\" ng-app=\"app\"><head>@<!doctype html><html lang=\"en\" ng-app=\"app\"><head><script id=\"semoss-env\" type=\"application/json\">{\"MODULE\":\"$FE_ROUTE\"}</script>@g" $TOMCAT_HOME/webapps/SemossWeb/index.html
    #sed -i "s@<!doctype html><html><head><meta charset=\"utf-8\"/>@<!doctype html><html><head><meta charset=\"utf-8\"/><script id=\"semoss-env\" type=\"application/json\">{\"MODULE\":\"$FE_ROUTE\"}</script>@g" $TOMCAT_HOME/webapps/SemossWeb/packages/client/dist/index.html
    sed -i "/<head>/a\        <script id=\"semoss-env\" type=\"application/json\">{\"MODULE\":\"$FE_ROUTE\"}</script>" index.html
fi
