#!/bin/sh
docker stop kazoo-rabbitmq
docker rm kazoo-rabbitmq
docker run -td --name kazoo-rabbitmq kazoo/rabbitmq
