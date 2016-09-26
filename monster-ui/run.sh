#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
NAME=monster-ui.kazoo
docker stop $NAME
docker rm -f $NAME
docker run $FLAGS --net kazoo -h $NAME --name $NAME kazoo/monster-ui
