#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-kazoo-ui
docker rm kazoo-kazoo-ui
docker run $FLAGS --net kazoo --name kazoo-kazoo-ui kazoo/kazoo-ui
