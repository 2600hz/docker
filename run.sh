#!/bin/sh
NETWORK=${1:-"kazoo"}
DBVOLUME=${2:-"kazoo-db"}
export NETWORK
echo -n "starting network: $NETWORK "
docker network create $NETWORK

echo -n "Creating db volume"
docker volume create $DBVOLUME

rabbitmq/run.sh
couchdb/run.sh

kazoo/run.sh
kamailio/run.sh
freeswitch/run.sh

monster-ui/run.sh
