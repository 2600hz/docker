#!/bin/sh
cp -a etc/kamailio /etc/
cp etc/kamctlrc ./kamctlrc

kamdbctl reinit

sed -i -E  "s/mpath=/#mpath=/g" /etc/kamailio/default.cfg
sed -i -E  's/modparam\("mi_fifo"/#modparam\("mi_fifo"/g' /etc/kamailio/default.cfg

useradd -d /var/run/kamailio kamailio