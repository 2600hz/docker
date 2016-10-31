#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=makebusy-fs.$NETWORK
docker stop $NAME
docker rm $NAME
# it is privileged due to interface creation
docker run $FLAGS --privileged --restart unless-stopped --net $NETWORK -h $NAME --name $NAME kazoo/makebusy-fs
