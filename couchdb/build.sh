#!/bin/sh
docker stop kazoo-couchdb
docker rm kazoo-couchdb
docker build -t kazoo/couchdb .
