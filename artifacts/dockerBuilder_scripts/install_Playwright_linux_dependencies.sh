#!/bin/bash
set -e

# Install Playwright dependencies and the chromium browser binaries
if [ -f "/tmp/pom.xml" ]; then 
  mvn exec:java -e -D exec.mainClass=com.microsoft.playwright.CLI -D exec.args="install-deps chromium"
else
  echo "pom file not found"
fi