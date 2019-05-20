#!/bin/sh -e
apt-get update && apt-get install -y gnupg2 wget
wget -O - https://files.freeswitch.org/repo/deb/freeswitch-1.8/fsstretch-archive-keyring.asc | apt-key add -

echo "deb http://files.freeswitch.org/repo/deb/freeswitch-1.8/ stretch main" > /etc/apt/sources.list.d/freeswitch.list
echo "deb-src http://files.freeswitch.org/repo/deb/freeswitch-1.8/ stretch main" >> /etc/apt/sources.list.d/freeswitch.list

# you may want to populate /etc/freeswitch at this point.
# if /etc/freeswitch does not exist, the standard vanilla configuration is deployed
apt-get update

apt-get install -y --force-yes freeswitch-meta-all \
	ladspa-sdk tap-plugins swh-plugins libgsm1 libfftw3-3 autotalent \
	librabbitmq-dev autoconf libtool-bin zlib1g-dev libjpeg-dev \
	pkg-config
apt-get -y clean
