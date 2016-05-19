#!/bin/sh
echo monster-ui ip: `bin/get-ip kazoo-monster-ui`
echo kazoo ip: `bin/get-ip kazoo`
echo rabbitmq ip: `bin/get-ip kazoo-rabbitmq`
echo freeswitch ip: `bin/get-ip kazoo-freeswitch`
echo kamailio ip: `bin/get-ip kazoo-kamailio`
echo couchdb ip: `bin/get-ip kazoo-couchdb`

