#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
NAME=kazoo.kazoo
docker stop $NAME
docker rm $NAME
docker run $FLAGS --net kazoo -h $NAME --name $NAME kazoo/kazoo
