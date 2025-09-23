#!/bin/bash
set -e

# Create POM file to manage Playwright 1.48.0 native linux lib dependencies
cat << 'EOF' > /tmp/pom.xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/maven-v4_0_0.xsd">
  <modelVersion>4.0.0</modelVersion>
  <groupId>com.microsoft.playwright</groupId>
  <artifactId>playwright-minimal</artifactId>
  <version>0.1</version>
  <dependencies>
    <dependency>
      <groupId>com.microsoft.playwright</groupId>
      <artifactId>playwright</artifactId>
      <version>1.48.0</version>
    </dependency>
  </dependencies>
</project>	
EOF

# Install Playwright dependencies and the chromium browser binaries
mvn exec:java -e -D exec.mainClass=com.microsoft.playwright.CLI -D exec.args="install-deps chromium"