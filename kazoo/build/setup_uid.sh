#!/bin/bash
if [ -n "$SKIP_BUILD" ]
then
	usermod -u $UID user
	groupmod -g $GID user
fi
