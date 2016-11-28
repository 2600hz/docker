FROM alpine:3.3
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

RUN apk add --update asterisk && rm -rf /var/cach/apk/*
COPY etc/asterisk /etc/asterisk

COPY build/run.sh build/run.sh

ENTRYPOINT "build/run.sh"
