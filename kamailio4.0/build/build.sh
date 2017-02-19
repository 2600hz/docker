#!/bin/sh -e
cd libevbuffsock
make
make install

cd ../libnsq
make
make install

cd ../
cp libnsq/utlist.h /usr/local/include/

cd ./kamailio
make
make install
