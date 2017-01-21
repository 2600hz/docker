#!/bin/sh
CONFIG=${CONFIG:-"master"}
git clone https://github.com/2600hz/kazoo-configs.git kazoo-configs
cd kazoo-configs
git reset --hard $CONFIG
cd ../
