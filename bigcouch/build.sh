#!/bin/sh
docker stop kazoo/bigcouch
docker rm kazoo/bigcouch
docker build -t kazoo/bigcouch .
