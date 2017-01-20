#!/bin/bash
COMMAND=${1:-"remote_console"}
export KAZOO_CONFIG=$HOME/config.ini
export KAZOO_NODE=$NODE_NAME@$(hostname)
export RELX_REPLACE_OS_VARS=true
export KZname="-name $KAZOO_NODE"

cd kazoo
exec _rel/kazoo/bin/kazoo $COMMAND $*
