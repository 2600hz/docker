#!/bin/sh -e
curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 19.2 19.2
./kerl install 19.2 erlang
. erlang/activate
./kerl cleanup all
