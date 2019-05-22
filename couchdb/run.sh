#!/bin/sh -e
FLAGS=${1:-"-td"}
IMAGE=${2:-"kazoo/couchdb2"}
VOLUME=${3:-"kazoo-db"}
NETWORK=${NETWORK:-"kazoo"}
NAME=couchdb.$NETWORK

if [ -n "$(docker ps -aq -f name=$NAME)" ]
then
   echo -n "stopping: "
   docker stop -t 1 $NAME
   echo -n "removing: "
   docker rm -f $NAME
fi
echo -n "starting: $NAME "

docker run $FLAGS \
	--net $NETWORK \
   --mount source=$VOLUME,target=/usr/local/etc/couchdb/data \
   -p 5984:5984 \
   -p 5986:5986 \
	-h $NAME \
	--name $NAME \
	$IMAGE
