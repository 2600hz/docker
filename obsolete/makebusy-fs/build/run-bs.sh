#!/bin/sh
echo setting up ip
build/setup-ip.sh
cd /usr/local/freeswitch
./run.sh
