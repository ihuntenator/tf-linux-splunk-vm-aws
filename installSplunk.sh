#!/bin/bash

SPLUNK_HOME="/opt/splunk"
wget="/usr/bin/wget"

${wget} -O splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.0.1&product=splunk&filename=splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm&wget=true'

sudo yum install -y splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm

${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt
${SPLUNK_HOME}/bin/splunk enable boot-start -user splunk

exit
