#!/bin/bash
sed -i '/<!--[[:space:]]*<Valve className="org.apache.catalina.valves.ErrorReportValve"/,/<\/Valve>[[:space:]]*-->/{s/<!--[[:space:]]*//;s/[[:space:]]*-->//;}' $TOMCAT_HOME/conf/server.xml
