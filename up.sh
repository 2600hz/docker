#!/bin/sh
docker network create kazoo
rabbitmq/run.sh
couchdb/run.sh
kamailio/run.sh
freeswitch/run.sh
kazoo/run.sh
monster-ui/run.sh
kazoo-ui/run.sh
