#!/bin/sh
cd /usr/local/src/freeswitch
make install

groupadd freeswitch

adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*

rm -rf /usr/local/freeswitch/etc/freeswitch
cp -a /usr/local/src/kazoo-configs/freeswitch /usr/local/freeswitch/etc/
cp -a /usr/local/src/kazoo-sounds/freeswitch /usr/local/freeswitch/share/freeswitch/sounds
