#!/bin/sh
cd base-os
./build.sh
cd ../kazoo-erlang
./build.sh
cd ../rabbitmq
./build.sh
cd ../couchdb
./build.sh
cd ../kamailio
./build.sh
cd ../freeswitch
./build.sh
cd ../kazoo
./build.sh
cd ../monster-ui
./build.sh
