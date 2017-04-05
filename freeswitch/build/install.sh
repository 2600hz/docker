#!/bin/sh -e
cd freeswitch
make install

groupadd freeswitch

adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-sounds
cp -a kazoo-sounds/freeswitch /usr/local/freeswitch/sounds

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*

rm -rf /usr/local/freeswitch/conf
cp -a /home/user/kazoo-configs/freeswitch /usr/local/freeswitch/conf/

