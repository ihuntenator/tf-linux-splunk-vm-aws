#!/bin/bash

SPLUNK_HOME=/opt/splunk

SPLUNK_VERSION=
wget=/usr/bin/wget
WGET_OPTS="-O splunk-$version-$build-Linux-x86_64.tgz"

$wget ${WGET_OPTS} "http://www.splunk.com/page/download_track?file=$version/splunk/linux/splunk-$version-$build-Linux-x86_64.tgz&ac=&wget=true&name=wget&platform=Linux&architecture=x86_64&version=$version&product=splunk&typed=release"

tar -xzvf splunk-$version-$build-Linux-x86_64.tgz  --directory=$SPLUNK_HOME --strip-components=1

$SPLUNK_HOME/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt
$SPLUNK_HOME/bin/splunk enable boot-start -user splunk

rm -f "splunk-$ver-$build-Linux-x86_64.tgz"

exit
