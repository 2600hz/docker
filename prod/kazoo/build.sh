#!/bin/sh
docker build -t kazoo/prod/kazoo .
./run.sh
docker export kazoo-prod.kazoo > kazoo-prod.tar
docker stop kazoo-prod.kazoo
docker rm kazoo-prod.kazoo
docker rmi kazoo/prod/kazoo
cat kazoo-prod.tar | docker import --change "ENTRYPOINT ./run.sh" - kazoo/prod/kazoo
rm -rf kazoo-prod.tar
