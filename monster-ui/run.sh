#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=monster-ui.$NETWORK
docker stop $NAME
docker rm -f $NAME
docker run $FLAGS --net $NETWORK -h $NAME --name $NAME kazoo/monster-ui
