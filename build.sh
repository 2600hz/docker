#!/bin/sh
cd base-os
./build.sh
cd ../kazoo-erlang
./build.sh
cd ../rabbitmq
./build.sh
cd ../couchdb
./build.sh
# fix kamailio version to 4.4.4
cd ../kamailio
./build.sh 2250b3e562d6dbcab1477c7ed5a71daa7e462bb9
cd ../freeswitch
./build.sh
cd ../kazoo
./build.sh
cd ../monster-ui
./build.sh
