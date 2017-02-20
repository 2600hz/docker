#!/bin/sh -e
COMMIT=$(cat /root/commit)
git clone https://github.com/mreiferson/libevbuffsock libevbuffsock
git clone https://github.com/nsqio/libnsq libnsq
git clone $REPO kamailio
cd kamailio
git checkout $COMMIT
cd ../
