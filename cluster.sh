#!/bin/sh
docker network create kazoo
docker network create zone1
docker network create zone2

export NETWORK=kazoo
rabbitmq/run.sh
couchdb/run.sh
kamailio/run.sh
monster-ui/run.sh

export NETWORK=zone1
kazoo/run.sh
freeswitch/run.sh

export NETWORK=zone2
kazoo/run.sh
freeswitch/run.sh
