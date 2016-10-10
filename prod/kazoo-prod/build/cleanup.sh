#!/bin/bash
rm -rf build
mv kazoo/_rel ./
rm -rf kazoo
mkdir kazoo
mv _rel kazoo
rm -rf .kerl
rm -rf kerl
rm -rf /root/build
apt-get purge -y python build-essential unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev 
apt-get autoremove -y
apt-get clean
