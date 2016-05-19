#!/bin/sh
docker rmi --force kazoo/rabbitmq
docker build -t kazoo/rabbitmq .
