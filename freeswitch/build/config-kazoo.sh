#!/bin/sh
git clone https://github.com/2600hz/kazoo-prompts.git /usr/local/freeswitch/sounds
rm -rf /etc/freeswitch
mkdir /etc/freeswitch
find /etc/kazoo/freeswitch/ -maxdepth 1 -name "*" -exec ln -s {} "/etc/freeswitch/" \;
cd /usr/local
groupadd freeswitch
adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch

chown -R freeswitch:freeswitch /usr/local/freeswitch/
chmod -R ug=rwX,o= /usr/local/freeswitch/
chmod -R u=rwx,g=rx /usr/local/freeswitch/bin/*