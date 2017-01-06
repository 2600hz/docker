#!/bin/sh
export SHM_MEMORY=64
export PKG_MEMORY=8
export USER=kamailio
export GROUP=kamailio

./config-local.sh

exec /usr/local/kamailio/sbin/kamailio -E -DD \
	-f /usr/local/kamailio/etc/kamailio/kamailio.cfg \
	-m $SHM_MEMORY -M $PKG_MEMORY -u $USER -g $GROUP
