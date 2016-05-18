#!/bin/sh
# git clone --depth 1 --no-single-branch https://github.com/2600hz/kazoo-prompts.git /usr/local/freeswitch/sounds

groupadd freeswitch

adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*

rm -rf /usr/local/freeswitch/conf # will be replaced