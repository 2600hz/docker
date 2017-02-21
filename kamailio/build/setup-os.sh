#!/bin/sh -e

apt-get -y install \
	make flex bison libmysqlclient-dev \
	libssl-dev libcurl4-openssl-dev \
	libxml2-dev libpcre3-dev librabbitmq-dev \
	libjson-c-dev pkg-config  libevent-dev libev-dev \
	uuid-dev libunistring-dev xsltproc \
	python libsnmp-dev bison
apt-get -y clean
