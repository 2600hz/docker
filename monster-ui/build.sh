#!/bin/sh
BUILD_ARG=${1:-""}
REPO=${2:-"https://github.com/2600hz/monster-ui.git"}
COMMIT=${3:-"$(../bin/get-commit $REPO)"}
if [ -d ~/.ssh ] && cp -a ~/.ssh etc/
echo Using repository $REPO commit $COMMIT
echo $COMMIT > etc/commit
docker build $BUILD_ARG -t kazoo/monster-ui --build-arg REPO=$REPO .
