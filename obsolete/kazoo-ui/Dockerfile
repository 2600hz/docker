FROM alpine:3.3
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

ARG REPO=https://github.com/2600hz/kazoo-ui.git 
ENV WWW=/usr/share/nginx

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/commit /root/commit
COPY build/build.sh build/build.sh
RUN build/build.sh

COPY etc etc
COPY build/run.sh build/run.sh
ENTRYPOINT "build/run.sh"

