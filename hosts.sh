#!/bin/sh
NETWORK=${1:-"kazoo"}
echo `bin/get-ip monster-ui.$NETWORK` monster-ui.$NETWORK
echo `bin/get-ip kazoo.$NETWORK` kazoo.$NETWORK
echo `bin/get-ip rabbitmq.$NETWORK` rabbitmq.$NETWORK
echo `bin/get-ip freeswitch.$NETWORK` freeswitch.$NETWORK
echo `bin/get-ip kamailio.$NETWORK` kamailio.$NETWORK
echo `bin/get-ip couchdb.$NETWORK` couchdb.$NETWORK
