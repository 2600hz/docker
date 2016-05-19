#!/bin/sh
docker network create kazoo
rabbitmq/run.sh
couchdb/run.sh
