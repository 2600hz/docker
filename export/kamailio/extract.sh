#!/bin/sh
CONTAINER=${1:-"kamailio.kazoo"}
rm -rf kamailio
rm -rf kamailio.tar
mkdir -p kamailio/usr/local
mkdir -p kamailio/etc
mkdir -p kamailio/root
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec --user root $CONTAINER /root/find-debian-deps.sh /usr/local | sed -e 's/\x0D//' > etc/deps
docker exec --user root $CONTAINER rm -f /root/find-debian-deps.sh
docker cp $CONTAINER:/usr/local kamailio/usr
cd kamailio && tar cf ../kamailio.tar ./ --owner=1000 --group=1000 && cd ../
rm -rf kamailio
