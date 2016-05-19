#!/bin/sh
docker rmi --force kazoo/kazoo
docker build -t kazoo/kazoo .
