#!/bin/sh -e
useradd -s /bin/bash -m user

apt-get update
apt-get -y upgrade

apt-get install -y vim curl wget git \
	build-essential \
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev

apt-get -y clean
