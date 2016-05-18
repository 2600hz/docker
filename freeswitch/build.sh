#!/bin/sh
docker stop kazoo/freeswitch
docker rm kazoo/freeswitch
docker build -t kazoo/freeswitch .
