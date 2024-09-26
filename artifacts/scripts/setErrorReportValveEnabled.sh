#!/bin/bash
sed -i 's/<!--ERROR_REPORT_VALVE_START//' $TOMCAT_HOME/conf/server.xml
sed -i 's/ERROR_REPORT_VALVE_END-->//' $TOMCAT_HOME/conf/server.xml
