#!/bin/sh
docker pull debian:jessie
docker pull klaemo/couchdb:2.0.0
docker pull node:latest
docker pull rabbitmq:3.6.2

cd base-os
./build.sh $*
cd ../kazoo-erlang
./build.sh $*
cd ../rabbitmq
./build.sh $*
cd ../couchdb
./build.sh $*
cd ../kamailio
./build.sh $*
cd ../freeswitch
./build.sh $*
cd ../kazoo
./build.sh $*
cd ../monster-ui
./build.sh $*
