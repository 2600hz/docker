#!/bin/sh
CONTAINER=${1:-"kazoo.kazoo"}
rm -rf kazoo
rm -rf kazoo.tar
mkdir kazoo
docker cp build/find-debian-deps.sh $CONTAINER:/root
docker exec -ti $CONTAINER /bin/bash -c "cd kazoo && make build-release"
docker exec -ti --user root $CONTAINER /root/find-debian-deps.sh /home/user | sed -e 's/\x0D//' > etc/deps
docker exec -ti --user root $CONTAINER rm -f /root/find-debian-deps.sh
docker cp -L $CONTAINER:/home/user/kazoo/_rel/ kazoo
docker cp -L $CONTAINER:/home/user/kazoo/rel/ kazoo
docker cp -L $CONTAINER:/home/user/config.ini kazoo
tar cf kazoo.tar kazoo/ --owner=1000 --group=1000
rm -rf kazoo
