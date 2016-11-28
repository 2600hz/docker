#!/bin/sh
CONTAINER=${1:-"kamailio.kazoo"}
rm -rf kamailio
rm -rf kamailio.tar
mkdir -p kamailio/usr/local
mkdir -p kamailio/etc
mkdir -p kamailio/root
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec -ti --user root $CONTAINER /root/find-debian-deps.sh /usr/local | sed -e 's/\x0D//' > etc/deps
docker exec -ti --user root $CONTAINER rm -f /root/find-debian-deps.sh
docker cp $CONTAINER:/usr/local kamailio/usr/
docker cp $CONTAINER:/etc/kamailio kamailio/etc/kamailio
docker cp $CONTAINER:/root/run.sh kamailio/root/run.sh
docker cp $CONTAINER:/root/config-local.sh kamailio/root/config-local.sh
cd kamailio && tar cf ../kamailio.tar ./ --owner=0 --group=0 && cd ../
rm -rf kamailio
