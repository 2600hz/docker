#!/bin/sh
docker stop kazoo-couchdb
docker rm kazoo-couchdb
docker run -td --net kazoo --name kazoo-couchdb kazoo/couchdb
