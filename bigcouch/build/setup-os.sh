#!/bin/sh
apt-get update
apt-get install -y \
	curl git python libicu-dev libcurl4-openssl-dev build-essential libmozjs-24-dev \
	unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev
apt-get install --fix-missing