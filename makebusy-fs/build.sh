#!/bin/sh
TYPE=${1:-"auth"}
FLAGS=${2:-""}
docker build $FLAGS -t kazoo/makebusy-fs .
