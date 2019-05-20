#!/bin/sh -e
curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 21.3 21.3
./kerl install 21.3 erlang
. erlang/activate
./kerl cleanup all
