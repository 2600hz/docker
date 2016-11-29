#!/bin/sh

# stop daily segment
./stop.sh daily

# save some space
docker rmi $(docker images -a --filter dangling=true -q)
docker rm $(docker ps -a --filter status=exited -q)

# rebuild everything
./build.sh --no-cache

# run daily segment
./run.sh daily

./after-start.sh daily

# run tests

# export images
export/all.sh daily
