#!/bin/sh
git clone https://github.com/mreiferson/libevbuffsock libevbuffsock
git clone --depth 1 --no-single-branch https://github.com/nsqio/libnsq libnsq
git clone --depth 1 --no-single-branch https://github.com/kamailio/kamailio.git kamailio
cd kamailio
git checkout tags/4.4.3
cd ../

# temporary
cd libevbuffsock
# git checkout ee239ec
