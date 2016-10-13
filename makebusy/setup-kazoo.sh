#!/bin/sh
./sup kapps_config set token_buckets tokens_fill_rate 100
./sup kapps_config set token_buckets crossbar {}
./sup kz_datamgr flush_cache_docs
docker commit couchdb.kazoo kazoo/couchdb-init
