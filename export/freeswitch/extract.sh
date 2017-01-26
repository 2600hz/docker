#!/bin/sh
CONTAINER=${1:-"freeswitch.kazoo"}
rm -rf freeswitch
rm -f freeswitch.tar
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec --user root $CONTAINER /root/find-debian-deps.sh /usr/local/freeswitch | sed -e 's/\x0D//' > etc/deps
docker exec --user root $CONTAINER rm -f /root/find-debian-deps.sh
curl http://files.freeswitch.org/repo/deb/debian/key.gpg > etc/freeswitch.key.gpg
docker cp $CONTAINER:/usr/local/freeswitch freeswitch
cp build/run-deploy.sh freeswitch/
rm -rf freeswitch/sounds/*
tar cf freeswitch.tar freeswitch/ --owner=1000 --group=1000
rm -rf freeswitch
