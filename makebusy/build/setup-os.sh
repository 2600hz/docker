#!/bin/sh
useradd -s /bin/bash -m user
yum -y install wget
wget --no-check-certificate https://packages.2600hz.com/centos/7/experimental/2600hz-release/2600hz-release-2016.06-16.el7.centos.noarch.rpm
yum install -y 2600hz-release-2016.06-16.el7.centos.noarch.rpm
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y update
yum install -y vim git kazoo-freeswitch httpd php56w php56w-xml net-tools
