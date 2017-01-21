#!/bin/sh
COMMIT=$(cat /root/commit)

git clone https://github.com/2600hz/kazoo-configs.git kazoo-configs
git clone https://github.com/kamailio/kamailio.git kamailio

cd kazoo-configs
git checkout ef98bf453cb81475bbf5ccbc0635749a975b093c
cd ../

cd kamailio
git checkout $COMMIT
