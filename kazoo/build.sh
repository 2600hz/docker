#!/bin/sh
docker stop kazoo/kazoo
docker rm kazoo/kazoo
docker build -t kazoo/kazoo .
