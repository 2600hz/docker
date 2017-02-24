#!/bin/sh
NETWORK=${1:-"kazoo"}
export NETWORK
echo -n "starting network: $NETWORK "
docker network create $NETWORK

docker start rabbitmq.$NETWORK
docker start couchdb.$NETWORK
docker start kazoo.$NETWORK
docker start kamailio.$NETWORK
docker start freeswitch.$NETWORK
docker start monster-ui.$NETWORK
