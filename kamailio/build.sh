#!/bin/sh
docker stop kazoo-kamailio
docker rm kazoo-kamailio
docker build -t kazoo/kamailio .
