#!/bin/sh
CONTAINER=${1:-"kamailio.kazoo"}
rm -rf kamailio
mkdir kamailio
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec -ti --user root $CONTAINER /root/find-debian-deps.sh /usr/local | sed -e 's/\x0D//' > etc/deps
docker exec -ti --user root $CONTAINER rm -f /root/find-debian-deps.sh
docker cp $CONTAINER:/usr/local kamailio/bin
docker cp $CONTAINER:/etc/kamailio kamailio/etc
docker cp $CONTAINER:/root/run.sh kamailio/run.sh
docker cp $CONTAINER:/root/config-local.sh kamailio/config-local.sh
