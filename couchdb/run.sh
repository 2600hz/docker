#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
NAME=couchdb.kazoo
docker stop $NAME
docker rm $NAME
docker run $FLAGS --net kazoo -h $NAME --name $NAME kazoo/couchdb
