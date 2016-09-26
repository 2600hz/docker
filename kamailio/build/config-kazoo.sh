#!/bin/sh
mkdir /etc/kazoo
mkdir /etc/kamailio
cp -a etc/kamailio /etc/kazoo
cp etc/kamailio/kamctlrc /etc/kamailio/

kamdbctl reinit

sed -i -E  "s/mpath=/#mpath=/g" /etc/kazoo/kamailio/default.cfg
sed -i -E  's/modparam\("mi_fifo"/#modparam\("mi_fifo"/g' /etc/kazoo/kamailio/default.cfg

cp /etc/kazoo/kamailio/local.cfg /etc/kazoo/kamailio/local.cfg.orig

rsync -av etc/kamailio/dbtext /etc/kazoo/kamailio/

kamctl dispatcher add 1 sip:freeswitch.kazoo:11000 0 1 ' ' ' '

useradd -d /var/run/kamailio kamailio
