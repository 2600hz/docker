#!/bin/sh
NETWORK=${1:-"kazoo"}
export NETWORK
echo -n "starting network: $NETWORK "
docker network create $NETWORK

echo Creating db volume
docker volume create kazoo-db

rabbitmq/run.sh
couchdb/run.sh

kazoo/run.sh
kamailio/run.sh
freeswitch/run.sh

monster-ui/run.sh
