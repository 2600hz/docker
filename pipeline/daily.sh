#!/bin/sh
export NETWORK=${1:-"kazoo"}

# stop daily segment
./stop.sh daily

# save some space
docker rmi $(docker images -a --filter dangling=true -q)
docker rm $(docker ps -a --filter status=exited -q)

# rebuild everything
./build.sh --no-cache

# run daily segment
./run.sh daily

pipeline/after-start.sh

# run tests

# export images
export/all.sh daily
