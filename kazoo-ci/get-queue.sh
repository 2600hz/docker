#!/bin/sh
ps -ef | grep build.sh | grep -v grep | awk '{print $10}'
