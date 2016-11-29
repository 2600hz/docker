#!/bin/sh
NETWORK=${1:-"kazoo"}
echo `bin/get-ip monster-ui.$NETWORK` monster-ui.$NETWORK
echo `bin/get-ip kazoo.$NETWORK` kazoo.$NETWORK
echo `bin/get-ip rabbitmq.$NETWORK` rabbitmq.$NETWORK 
echo `bin/get-ip freeswitch.$NETWORK` freeswitch.$NETWORK
echo `bin/get-ip kamailio.$NETWORK` kamailio.$NETWORK
echo `bin/get-ip couchdb.$NETWORK` couchdb.$NETWORK
echo `bin/get-ip makebusy.$NETWORK` makebusy.$NETWORK
echo `bin/get-ip makebusy-fs-auth.$NETWORK` makebusy-fs-auth.$NETWORK
echo `bin/get-ip makebusy-fs-pbx.$NETWORK` makebusy-fs-pbx.$NETWORK
echo `bin/get-ip makebusy-fs-carrier.$NETWORK` makebusy-fs-carrier.$NETWORK



