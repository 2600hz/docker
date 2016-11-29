#!/bin/sh
NETWORK=${1:-"kazoo"}
echo Starting network: $NETWORK
export NETWORK
docker network create $NETWORK
rabbitmq/run.sh
couchdb/run.sh
kamailio/run.sh
freeswitch/run.sh
kazoo/run.sh
monster-ui/run.sh
