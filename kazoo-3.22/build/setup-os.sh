#!/bin/sh
useradd -s /bin/bash -m user

apt-get update
apt-get upgrade

apt-get install -y --force-yes vim curl wget git \
	build-essential \
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev

wget -O - http://files.freeswitch.org/repo/deb/debian/key.gpg | apt-key add - 

apt-get clean
