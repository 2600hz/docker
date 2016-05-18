#!/bin/sh
docker rmi --force kazoo/base-os
docker build -t kazoo/base-os .
