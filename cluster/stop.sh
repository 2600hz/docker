#!/bin/sh
docker stop monster-ui.kazoo
docker stop kamailio.kazoo
docker stop couchdb.kazoo
docker stop rabbitmq.kazoo

docker stop freeswitch.zone1
docker stop kazoo.zone1

docker stop freeswitch.zone2
docker stop kazoo.zone2

docker network rm kazoo
docker network rm zone1
docker network rm zone2

