#!/bin/bash
if [ -n "$SKIP_BUILD" ]
then
	usermod -u $KZUID user
	groupmod -g $GID user
	apt-get -y install inotify-tools
fi
