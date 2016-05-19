#!/bin/sh
docker rmi --force kazoo/monster-ui
docker build -t kazoo/monster-ui .
