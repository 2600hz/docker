#!/bin/bash
COMMAND=${1:-"console"}
export KAZOO_CONFIG=$HOME/config.ini
sed -i "s|couchdb.kazoo|$COUCHDB|" $KAZOO_CONFIG
sed -i "s|rabbitmq.kazoo|$RABBITMQ|" $KAZOO_CONFIG
export KAZOO_NODE=$NODE_NAME@$(hostname)
export RELX_REPLACE_OS_VARS=true
export KZname="-name $KAZOO_NODE"
exec _rel/kazoo/bin/kazoo $COMMAND "$*"
