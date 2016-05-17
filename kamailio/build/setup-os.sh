#!/bin/sh
echo "deb http://deb.kamailio.org/kamailio jessie main" > /etc/apt/sources.list.d/kamailio.list
echo "deb-src http://deb.kamailio.org/kamailio jessie main" >> /etc/apt/sources.list.d/kamailio.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xfb40d3e6508ea4c8

apt-get update
apt-get install -y curl vim git wget kamailio kamailio-presence-modules kamailio-kazoo-modules

git clone https://github.com/2600hz/kazoo-configs /etc/kazoo