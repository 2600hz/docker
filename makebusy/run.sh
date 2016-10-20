#!/bin/sh
FLAGS=${1:-"-td"}
NETWORK=${NETWORK:-"kazoo"}
NAME=makebusy.$NETWORK
docker stop $NAME
docker rm $NAME
docker run $FLAGS --net $NETWORK -h $NAME --name $NAME kazoo/makebusy
FS_IP=`../bin/get-ip makebusy-fs.$NETWORK`
docker exec -ti $NAME build/setup-ip.sh $FS_IP
