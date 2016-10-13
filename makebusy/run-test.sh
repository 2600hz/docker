#!/bin/sh
./reset-kazoo.sh
echo Waiting for kazoo to start
watch -g "docker logs kazoo.kazoo | grep 'auto-started kapps'" > /dev/null
docker exec -ti makebusy.kazoo ./run-test.sh
docker cp makebusy.kazoo:/tmp/makebusy.log logs/
docker cp makebusy.kazoo:/tmp/makebusy.txt logs/
docker logs kazoo.kazoo > logs/kazoo.log

