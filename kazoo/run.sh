#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo
docker rm kazoo
docker run $FLAGS --net kazoo --name kazoo kazoo/kazoo
