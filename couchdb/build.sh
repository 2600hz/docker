#!/bin/sh
docker rmi --force kazoo/couchdb
docker build -t kazoo/couchdb .
