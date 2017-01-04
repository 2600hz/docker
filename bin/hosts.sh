#!/bin/sh
NETWORK=${1:-"kazoo"}
echo `bin/get-ip.sh monster-ui.$NETWORK` monster-ui.$NETWORK
echo `bin/get-ip.sh kazoo.$NETWORK` kazoo.$NETWORK
echo `bin/get-ip.sh rabbitmq.$NETWORK` rabbitmq.$NETWORK 
echo `bin/get-ip.sh freeswitch.$NETWORK` freeswitch.$NETWORK
echo `bin/get-ip.sh kamailio.$NETWORK` kamailio.$NETWORK
echo `bin/get-ip.sh couchdb.$NETWORK` couchdb.$NETWORK
echo `bin/get-ip.sh makebusy.$NETWORK` makebusy.$NETWORK
echo `bin/get-ip.sh makebusy-fs-auth.$NETWORK` makebusy-fs-auth.$NETWORK
echo `bin/get-ip.sh makebusy-fs-pbx.$NETWORK` makebusy-fs-pbx.$NETWORK
echo `bin/get-ip.sh makebusy-fs-carrier.$NETWORK` makebusy-fs-carrier.$NETWORK



