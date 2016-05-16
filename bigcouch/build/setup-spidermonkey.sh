#!/bin/sh
bash -c 'echo "deb http://ppa.launchpad.net/commonjs/ppa/ubuntu karmic main" >> /etc/apt/sources.list.d/commonjs.list'
apt-get update
apt-get install -y apt-utils
apt-get install -y --force-yes libmozjs-1.9.2 libmozjs-1.9.2-dev
ln -s /usr/lib/libmozjs-1.9.2.so /usr/lib/libmozjs.so