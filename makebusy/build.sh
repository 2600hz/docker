#!/bin/sh
cp -a ~/.ssh etc/
docker build -t kazoo/makebusy .
