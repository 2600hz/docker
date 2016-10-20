#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=makebusy-fs.$NETWORK
docker stop $NAME
docker rm $NAME
docker run $FLAGS --privileged --net $NETWORK -h $NAME --name $NAME kazoo/makebusy-fs
