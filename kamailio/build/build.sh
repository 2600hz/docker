#!/bin/sh
cd libevbuffsock
make
make install

cd ../libnsq
make
make install

cd ../kamailio
make cfg
copy ../etc/modules.lst ./
make
make install
