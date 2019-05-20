#!/bin/sh -e
apt-get build-dep -y freeswitch
cd freeswitch
./bootstrap.sh -j
./configure -C
