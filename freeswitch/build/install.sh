#!/bin/sh -e
cd freeswitch
make install

groupadd freeswitch

adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*

rm -rf /usr/local/freeswitch/conf
cp -a /home/user/kazoo-configs/freeswitch /usr/local/freeswitch/conf/
