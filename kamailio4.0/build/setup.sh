#!/bin/sh -e

git clone --depth 1 https://github.com/mreiferson/libevbuffsock libevbuffsock
git clone --depth 1 https://github.com/nsqio/libnsq libnsq
git clone --depth 1 --branch $KAMAILIO40_COMMIT $REPO kamailio
