#!/bin/sh
curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build 18.3 18.3
./kerl install 18.3 erlang
. erlang/activate

git clone git://github.com/rebar/rebar.git
cd rebar
./bootstrap

cd ../
git clone https://github.com/erlware/relx.git
cd relx
./rebar3 update
./rebar3 escriptize
