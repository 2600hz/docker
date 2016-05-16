#!/bin/sh
echo "deb http://files.freeswitch.org/repo/deb/debian-unstable/ jessie main" >> /etc/apt/sources.list.d/freeswitch.list
apt-get update
apt-get install -y --force-yes curl vim git freeswitch-all freeswitch-all-dbg gdb \
	libav-dbg libavcodec-dev libavcodec-extra libavdevice-dev \
	libavfilter-dev libavformat-dev libavresample-dev libavutil-dev libswscale-dev

git clone https://github.com/2600hz/kazoo-configs /etc/kazoo