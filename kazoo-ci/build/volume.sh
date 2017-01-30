#!/bin/sh
if [ -d /home/user/volume ]
then
	mkdir -p /home/user/volume/log
	chown -R user:docker /home/user/volume/log
	cd /home/user/tests
	for file in *
	do
		rm -rf /home/user/volume/$file
		cp -a /home/user/tests/$file /home/user/volume/
	done
fi