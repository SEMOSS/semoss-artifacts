#!/bin/bash
set -e

arr=("semoss" "semoss-ui" "monolith") 
echo "Create cddl_epl_lgpl_mpl.txt file from the pom files"
for folder in "${arr[@]}"; do
    #echo "folder $folder" >> /opt/license/cddl_epl_lgpl_mpl.txt
    cd /opt/license/$folder
    mvn license:add-third-party
    grep -Ei 'CDDL|Eclipse Public License|LGPL|Mozilla Public License' \
    ./target/generated-sources/license/THIRD-PARTY.txt | \
    grep -oE '[a-zA-Z0-9_.-]+:[a-zA-Z0-9_.-]+:[a-zA-Z0-9_.-]+' | \
    sort | uniq >> /opt/license/cddl_epl_lgpl_mpl.txt    
done

echo "downloading jars found in the cddl_epl_lgpl_mpl.txt file to /opt/ctu/lib/packages/source-jars"
mkdir -p /opt/ctu/lib/packages/source-jars/ && cd /opt/ctu/lib/packages/
while IFS=: read -r group artifact version; do
      group_path=$(echo "$group" | tr . /); \
      mvn dependency:get -Dartifact="$group:$artifact:$version:jar:sources"; \
      src_jar="$HOME/.m2/repository/$group_path/$artifact/$version/${artifact}-${version}-sources.jar"; \
      [ -f "$src_jar" ] && cp "$src_jar" /opt/ctu/lib/packages/source-jars/; \
done < /opt/license/cddl_epl_lgpl_mpl.txt
