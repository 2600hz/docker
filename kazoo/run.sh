#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=kazoo.$NETWORK
docker stop -t 1 $NAME
docker rm -f $NAME
docker run $FLAGS --net $NETWORK -h $NAME --name $NAME kazoo/kazoo
