#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}
repo=https://github.com/2600hz/kazoo.git
kazoo_commit=HEAD

docker build $BUILD_FLAGS \
       --build-arg REPO=$repo \
       --build-arg KAZOO_COMMIT=$kazoo_commit \
       -t $NETWORK/erlang .
