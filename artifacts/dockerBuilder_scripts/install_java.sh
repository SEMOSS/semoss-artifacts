#ORIGINAL
# arch=$(uname -m)
# if [[ $arch == x86_64* ]]; then
#     echo "X64 Architecture"
#     wget -O /tmp/zulujdk.tar.gz https://cdn.azul.com/zulu/bin/zulu8.78.0.19-ca-jdk8.0.412-linux_x64.tar.gz
#     tar --extract --file /tmp/zulujdk.tar.gz --directory "$JAVA_HOME" --strip-components 1
# elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
#     echo "ARM Architecture"
#     wget -O /tmp/zulujdk.tar.gz https://cdn.azul.com/zulu-embedded/bin/zulu8.76.0.17-ca-jdk8.0.402-linux_aarch64.tar.gz
#     tar --extract --file /tmp/zulujdk.tar.gz --directory "$JAVA_HOME" --strip-components 1
#     apt-get install -y openjfx
# fi

###################################################

arch=$(uname -m)
if [[ $arch == x86_64* ]]; then
    echo "X64 Architecture"
    wget -O /tmp/zulujdk.tar.gz https://cdn.azul.com/zulu/bin/zulu${AZUL_ZULU_VERSION}-ca-jdk${JDK_VERSION}-linux_x64.tar.gz
    tar --extract --file /tmp/zulujdk.tar.gz --directory "$JAVA_HOME" --strip-components 1
elif  [[ $arch == arm* ]] || [[ $arch = aarch64 ]]; then
    echo "ARM Architecture"
    wget -O /tmp/zulujdk.tar.gz https://cdn.azul.com/zulu/bin/zulu${AZUL_ZULU_VERSION}-ca-jdk${JDK_VERSION}-linux_aarch64.tar.gz
    tar --extract --file /tmp/zulujdk.tar.gz --directory "$JAVA_HOME" --strip-components 1
    apt-get install -y openjfx
fi
