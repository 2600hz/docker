#!/bin/sh
while read q; do docker exec -d kazoo-ci ./build.sh $q; done
