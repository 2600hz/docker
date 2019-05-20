#!/bin/sh -e
apt-get install -y make python build-essential zip unzip libexpat-dev \
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev python procps \
	autoconf automake elixir
apt-get -y clean
