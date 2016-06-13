#!/bin/sh
cp -a etc/kamailio /etc/

kamdbctl reinit

sed -i -E  "s/mpath=/#mpath=/g" /etc/kamailio/default.cfg
sed -i -E  's/modparam\("mi_fifo"/#modparam\("mi_fifo"/g' /etc/kamailio/default.cfg

cp /etc/kamailio/local.cfg /etc/kamailio/local.cfg.orig

rsync -av etc/kamailio/dbtext /etc/kamailio/

kamctl dispatcher add 1 sip:freeswitch.kazoo:11000 0 1 ' ' ' '

useradd -d /var/run/kamailio kamailio
