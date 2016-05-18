#!/bin/sh
git clone --depth 1 --no-single-branch https://git-wip-us.apache.org/repos/asf/couchdb.git couchdb
cd couchdb
./configure --prefix=/usr/local --databasedir=/srv --viewindexdir=/srv --logdir=/var/log/couchdb --sysconfdir=/etc/kazoo/bigcouch --disable-docs