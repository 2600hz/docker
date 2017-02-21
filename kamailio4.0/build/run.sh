#!/bin/sh -e

export SHM_MEMORY=64
export PKG_MEMORY=8
export USER=kamailio
export GROUP=kamailio

./config-local.sh

exec /usr/local/sbin/kamailio -E -DD \
     -P /run/kamailio/kamailio.pid \
     -f /etc/kamailio/kamailio.cfg \
     -m $SHM_MEMORY -M $PKG_MEMORY -u $USER -g $GROUP
