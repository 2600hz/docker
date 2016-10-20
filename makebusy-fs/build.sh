#!/bin/sh
FLAGS=${1:-""}
docker build $FLAGS -t kazoo/makebusy-fs .
