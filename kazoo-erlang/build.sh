#!/bin/sh -e

NETWORK=${NETWORK:-'kazoo'}
OTP_vsn=${1:-'19.2'}
kerl_url=${2:-'https://raw.githubusercontent.com/kerl/kerl/master/kerl'}

docker build $BUILD_FLAGS \
       --build-arg OTP=$OTP_vsn \
       --build-arg KERL_URL=$kerl_url \
       -t $NETWORK/erlang .
