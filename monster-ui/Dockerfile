FROM node:latest
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

ARG REPO
ARG COMMIT_MONSTER
ARG APPS
ARG TOKEN

ENV WWW=/usr/share/nginx

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY build/setup-apps.sh build/setup-apps.sh
RUN build/setup-apps.sh

COPY etc etc

COPY build/build.sh build/build.sh
RUN build/build.sh

COPY build/run.sh build/run.sh
ENTRYPOINT "build/run.sh"

