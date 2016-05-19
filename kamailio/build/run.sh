#!/bin/sh
export CFGFILE=/etc/kamailio/kamailio.cfg
export SHM_MEMORY=64
export PKG_MEMORY=8
export USER=kamailio
export GROUP=kamailio

MY_IP=$(ip route get 8.8.8.8 | awk '/8.8.8.8/ {print $NF}')
echo kamailio ip $MY_IP

exec /usr/local/sbin/kamailio -DD -P /run/kamailio/kamailio.pid -m $SHM_MEMORY -M $PKG_MEMORY -u $USER -g $GROUP
