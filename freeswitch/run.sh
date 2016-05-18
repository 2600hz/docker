#!/bin/sh
docker stop kazoo-freeswitch
docker rm kazoo-freeswitch
docker run -ti --name kazoo-freeswitch kazoo/freeswitch
