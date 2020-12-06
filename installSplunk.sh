#!/bin/bash

SPLUNK_HOME="/opt/splunk"
wget="/usr/bin/wget"

${wget} -O splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=8.1.0.1&product=splunk&filename=splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm&wget=true'

yum install -y splunk-8.1.0.1-24fd52428b5a-linux-2.6-x86_64.rpm

sudo -u splunk ". /opt/splunk/bin/setSplunkEnv; /opt/splunk/bin/splunk --answer-yes --no-prompt --accept-license --seed-passwd admin"

${SPLUNK_HOME}/bin/splunk enable boot-start -systemd-managed 1 -user splunk

${SPLUNK_HOME}/bin/splunk start


#${SPLUNK_HOME}/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd admin
#${SPLUNK_HOME}/bin/splunk edit user admin -password NEWPASSWORD -auth admin:changeme

exit
