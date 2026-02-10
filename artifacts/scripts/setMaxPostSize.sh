#!/bin/bash

SEMOSS_MAX_POST_SIZE="$1"
SCRIPT_TOMCAT_HOME="$2"

if grep -q 'maxPostSize="' "$SCRIPT_TOMCAT_HOME/conf/server.xml"; then
    sed -i "s/maxPostSize=\"[^\"]*\"/maxPostSize=\"${SEMOSS_MAX_POST_SIZE}\"/" "$SCRIPT_TOMCAT_HOME/conf/server.xml"
else
    sed -i "s/port=\"8080\"/port=\"8080\" maxPostSize=\"${SEMOSS_MAX_POST_SIZE}\"/" "$SCRIPT_TOMCAT_HOME/conf/server.xml"
fi