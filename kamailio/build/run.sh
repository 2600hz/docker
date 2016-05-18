#!/bin/sh
export CFGFILE=/etc/kamailio/kamailio.cfg
export SHM_MEMORY=64
export PKG_MEMORY=8
export USER=kamailio
export GROUP=kamailio
exec /usr/local/sbin/kamailio -DD -P /run/kamailio/kamailio.pid -m $SHM_MEMORY -M $PKG_MEMORY -u $USER -g $GROUP