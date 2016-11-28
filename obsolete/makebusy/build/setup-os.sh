#!/bin/sh
useradd -s /bin/bash -m user
apt-get -y update
apt-get -y install git vim unzip
