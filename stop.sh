#!/bin/sh
docker stop -t 1 monster-ui.kazoo
docker stop -t 1 kazoo.kazoo
docker stop -t 1 freeswitch.kazoo
docker stop -t 1 kamailio.kazoo
docker stop -t 1 couchdb.kazoo
docker stop -t 1 rabbitmq.kazoo
