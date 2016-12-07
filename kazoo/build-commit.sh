#!/bin/sh
COMMIT=$1
NETWORK=${NETWORK:-"kazoo"}
REPO=https://github.com/2600hz/kazoo.git
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build -q -t $NETWORK/kazoo --build-arg REPO=$REPO .
