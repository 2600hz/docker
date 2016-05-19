#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-ti
fi
docker stop kazoo-admin
docker rm kazoo-admin
docker run $FLAGS --net kazoo --name kazoo-admin kazoo/admin
