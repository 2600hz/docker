#!/bin/sh
curl -O https://raw.githubusercontent.com/kerl/kerl/master/kerl
chmod +x kerl
./kerl update releases
./kerl build  R15B03-1  R15B03-1
./kerl install R15B03-1 R15B03-1