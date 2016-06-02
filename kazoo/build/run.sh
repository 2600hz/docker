#!/bin/bash
. erlang/activate

if [ "$KAZOO_CONFIG" = "" ]
then
   export KAZOO_CONFIG=$HOME/config.ini
fi

if [ "$KAZOO_NODE" = "" ]
then
   KAZOO_NODE=kazoo@kazoo
fi

CMD=$1
if [ "$CMD" = "" ]
then
   CMD=console
else
	shift
fi

export RELX_REPLACE_OS_VARS=true
export KZname="-sname $KAZOO_NODE"

cd kazoo
exec _rel/kazoo/bin/kazoo $CMD "$*"
