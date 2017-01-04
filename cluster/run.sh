#!/bin/sh
docker network create kazoo
docker network create zone1
docker network create zone2

export NETWORK=kazoo
rabbitmq/run.sh
couchdb/run.sh
kamailio/run.sh
monster-ui/run.sh

RABBITMQ_IP=$(bin/get-ip.sh rabbitmq.kazoo)
COUCHDB_IP=$(bin/get-ip.sh couchdb.kazoo)

export NETWORK=zone1
kazoo/run.sh "-td --add-host rabbitmq.kazoo:$RABBITMQ_IP --add-host couchdb.kazoo:$COUCHDB_IP"
freeswitch/run.sh

export NETWORK=zone2
kazoo/run.sh "-td --add-host rabbitmq.kazoo:$RABBITMQ_IP --add-host couchdb.kazoo:$COUCHDB_IP"
freeswitch/run.sh

# disable isolation
KAZOO=br-$(docker network inspect --format '{{ .Id }}' kazoo | cut -c1-12)
ZONE1=br-$(docker network inspect --format '{{ .Id }}' zone1 | cut -c1-12)
ZONE2=br-$(docker network inspect --format '{{ .Id }}' zone2 | cut -c1-12)

sudo iptables -D DOCKER-ISOLATION -i $KAZOO -o $ZONE1 -j DROP
sudo iptables -D DOCKER-ISOLATION -i $ZONE1 -o $KAZOO -j DROP

sudo iptables -D DOCKER-ISOLATION -i $KAZOO -o $ZONE2 -j DROP
sudo iptables -D DOCKER-ISOLATION -i $ZONE2 -o $KAZOO -j DROP
