#!/bin/sh
apt-get -y install net-tools moreutils
rm -rf /usr/local/freeswitch/conf/
cp -a etc/freeswitch /usr/local/freeswitch/conf
