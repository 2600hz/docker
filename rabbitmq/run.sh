#!/bin/sh
docker stop kazoo-rabbitmq
docker rm kazoo-rabbitmq
docker run -td --net kazoo --name kazoo-rabbitmq kazoo/rabbitmq
