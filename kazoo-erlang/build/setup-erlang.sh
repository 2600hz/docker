#!/bin/sh
curl -O -k https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 18.3 18.3
./kerl install 18.3 erlang
. erlang/activate
./kerl cleanup all
