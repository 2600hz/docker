#!/bin/sh
cd freeswitch
make install
make cd-sounds-install cd-moh-install

groupadd freeswitch

adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*

rm -rf /usr/local/freeswitch/conf # will be replaced
