#!/bin/sh
REPO=${1:-"https://github.com/2600hz/monster-ui.git"}
cp -a ~/.ssh etc/
echo Using repository $REPO
../bin/get-commit $REPO > etc/commit
echo Using repository $REPO commit: `cat etc/commit`
docker build -t kazoo/monster-ui  --build-arg REPO=$REPO .
