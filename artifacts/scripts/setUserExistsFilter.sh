#!/bin/bash
sed -i '/<!--UserExistsFilter/d; /UserExistsFilter-->/d' $TOMCAT_HOME/webapps/Monolith/WEB-INF/web.xml
