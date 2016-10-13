#!/bin/sh
FLAGS=${1:-""}
REPO=${2:-"git@github.com:2600hz/make-busy.git"}
cp -a ~/.ssh etc/
echo Using repository $REPO
../bin/get-commit $REPO > etc/commit
./get-api.sh > etc/api_key
echo Using repository $REPO commit: `cat etc/commit`
docker build $FLAGS -t kazoo/makebusy .
