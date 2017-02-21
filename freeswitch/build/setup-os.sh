#!/bin/sh -e

apt-get install -y --force-yes freeswitch-video-deps-most \
	ladspa-sdk tap-plugins swh-plugins libgsm1 libfftw3-3 autotalent \
	librabbitmq-dev
apt-get -y clean
