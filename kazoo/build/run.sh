#!/bin/bash
KAZOO_CONFIG=$HOME/config.ini
sed -i "s|couchdb.kazoo|$COUCHDB|" $KAZOO_CONFIG
sed -i "s|rabbitmq.kazoo|$RABBITMQ|" $KAZOO_CONFIG
KAZOO_NODE=$NODE_NAME@$(hostname)
KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
export RELX_REPLACE_OS_VARS=true
export KZname="-name $KAZOO_NODE"

cd kazoo
exec _rel/kazoo/bin/kazoo console
