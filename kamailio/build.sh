#!/bin/sh
docker rmi --force kazoo/kamailio
docker build -t kazoo/kamailio .
