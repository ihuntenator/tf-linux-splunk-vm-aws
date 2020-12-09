#!/bin/bash

SPLUNK_HOME="/opt/splunk"
wget="/usr/bin/wget"

${wget} -O splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.0.1&product=splunk&filename=splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm&wget=true'

yum install -y splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm

${SPLUNK_HOME}/bin/splunk enable boot-start --accept-license --answer-yes --no-prompt -user splunk

cat << EOF > ${SPLUNK_HOME}/etc/system/local/web.conf
[settings]
enableSplunkWebSSL = true
#privKeyPath = etc/auth/mycerts/mySplunkWebPrivateKey.key
#serverCert = etc/auth/mycerts/mySplunkWebCertificate.pem
EOF

chown splunk:splunk ${SPLUNK_HOME}/etc/system/local/web.conf

cat << 'EOF' > ${SPLUNK_HOME}/etc/system/local/user-seed.conf
[user_info]
USERNAME = admin
HASHED_PASSWORD = $6$BN1nok8HIHl82R8R$NRsdcw.CHZJWyYNlXmDlnKz1JZRiVEg5Yo8uTwIT8qFcgWyUCoTba9iNfv/j6QCo4YSIq7h2UiKNKotGxx2uo1
EOF


${SPLUNK_HOME}/bin/splunk start

exit
