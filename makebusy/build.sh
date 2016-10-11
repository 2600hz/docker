#!/bin/sh
FLAGS=${1:-""}
cp -a ~/.ssh etc/
docker build $FLAGS -t kazoo/makebusy .
