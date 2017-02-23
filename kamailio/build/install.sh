#!/bin/sh -e

KAMAILIO_BASE="/usr/local/kamailio"
CFG_BASE="$KAMAILIO_BASE/etc/kamailio"
DEFAULT_CFG="$CFG_BASE/default.cfg"
DEFS_CFG="$CFG_BASE/defs.cfg"
LOCAL_CFG="$CFG_BASE/local.cfg"
DISPATCHER_CFG="$CFG_BASE/dispatcher-role.cfg"
KAMCTLRC="$KAMAILIO_BASE/.kamctlrc"

cd kamailio
make install

groupadd kamailio
adduser --disabled-password --quiet --system --home $KAMAILIO_BASE --ingroup kamailio kamailio

rm -rf $CFG_BASE
cp -a ~/kazoo-configs/kamailio $CFG_BASE
sed -i 's|loadmodule "mi_fifo.so"||g;s|mpath=|#mpath=|g' $DEFAULT_CFG
sed -i 's|/etc/kazoo/kamailio/dbtext|/usr/local/kamailio/etc/kamailio/dbtext|g' $DEFS_CFG
sed -i 's|/etc/kazoo/kamailio/dbtext|/usr/local/kamailio/etc/kamailio/dbtext|g' $LOCAL_CFG
sed -i 's|/etc/kazoo/kamailio/dbtext|/usr/local/kamailio/etc/kamailio/dbtext|g' $DISPATCHER_CFG

cp -a ~/kamailio/utils/kamctl/kamctlrc $KAMCTLRC
sed -i 's|# DBENGINE=MYSQL|DBENGINE=DBTEXT|g' $KAMCTLRC
sed -i 's|# DB_PATH="/usr/local/etc/kamailio/dbtext"|DBTEXT_PATH="/usr/local/kamailio/etc/kamailio/dbtext"|g' $KAMCTLRC
sed -i 's|# DBTEXT_PATH="/usr/local/etc/kamailio/dbtext"|DBTEXT_PATH="/usr/local/kamailio/etc/kamailio/dbtext"|g' $KAMCTLRC
sed -i 's|# INSTALL_EXTRA_TABLES=ask|INSTALL_EXTRA_TABLES=no|g' $KAMCTLRC
sed -i 's|# INSTALL_PRESENCE_TABLES=ask|INSTALL_PRESENCE_TABLES=yes|g' $KAMCTLRC
sed -i 's|# INSTALL_DBUID_TABLES=ask|INSTALL_DBUID_TABLES=no|g' $KAMCTLRC

chown -R kamailio:kamailio $KAMAILIO_BASE
chown -R kamailio:kamailio $KAMCTLRC

chmod -R ug=rwX,o= $KAMAILIO_BASE
chmod -R u=rwx,g=rx $KAMAILIO_BASE/sbin/*

mkdir -p /var/run/kamailio/
chown kamailio:kamailio /var/run/kamailio/

chown -R kamailio:kamailio $CFG_BASE

