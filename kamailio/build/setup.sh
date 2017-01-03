#!/bin/sh
COMMIT=${COMMIT:-"HEAD"}
git clone https://github.com/mreiferson/libevbuffsock libevbuffsock
git clone --depth 1 --no-single-branch https://github.com/nsqio/libnsq libnsq
git clone https://github.com/kamailio/kamailio.git kamailio
cd kamailio
git checkout $COMMIT
cd ../
