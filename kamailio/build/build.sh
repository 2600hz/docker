#!/bin/sh
cd libevbuffsock
make
make install

cd ../libnsq
make
make install

cd ../kamailio
make
make install
