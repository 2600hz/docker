#!/bin/sh
FLAGS=$1
if [ "$FLAGS" = "" ]
then
	FLAGS=-td
fi
docker stop kazoo-couchdb
docker rm kazoo-couchdb
docker run $FLAGS --net kazoo --name kazoo-couchdb kazoo/couchdb
