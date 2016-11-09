#!/bin/sh
REPO=${2:-"git@github.com:2600hz/make-busy.git"}
COMMIT=${1:-$(../bin/get-commit $REPO)}
FLAGS=${3:-""}
cp -a ~/.ssh etc/
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
./get-api.sh > etc/api_key
docker build $FLAGS -t kazoo/makebusy .
