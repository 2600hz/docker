#!/bin/sh
cd kazoo
./sup kapps_config set token_buckets tokens_fill_rate 1000
./sup kapps_config set token_buckets [crossbar, tokens_fill_rate] 1000
./sup kz_datamgr flush_cache_docs
