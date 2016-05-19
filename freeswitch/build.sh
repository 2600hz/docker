#!/bin/sh
docker rmi --force kazoo/freeswitch
docker build -t kazoo/freeswitch .
