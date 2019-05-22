#!/bin/sh -e
VOLUME=${1:-"kazoo-db"}
FLAGS=${2:-"-td"}
IMAGE=${3:-"kazoo/couchdb2"}
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
