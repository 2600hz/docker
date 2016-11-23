#!/bin/sh
CONTAINER=${1:-"freeswitch.kazoo"}
rm -rf freeswitch
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec -ti --user root $CONTAINER /root/find-debian-deps.sh /usr/local/freeswitch | sed -e 's/\x0D//' > etc/deps
docker exec -ti --user root $CONTAINER rm -f /root/find-debian-deps.sh
docker cp $CONTAINER:/usr/local/freeswitch freeswitch
rm -rf freeswitch/sounds/*
curl http://files.freeswitch.org/repo/deb/debian/key.gpg > etc/freeswitch.key.gpg
