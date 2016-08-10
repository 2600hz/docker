#!/bin/sh
cd base-os
./build.sh
cd ../admin
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
cd ../kazoo-ui
./build.sh
cd ../carrier-sink
./build.sh
