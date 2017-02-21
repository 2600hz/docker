FROM docker
MAINTAINER Roman Galeev <jamhed@2600hz.com>

EXPOSE 80

ARG TOKEN
ARG DOCKER
ARG REPO_MB
ARG REPO_MB_CALLFLOW
ARG REPO_MB_CONFERENCE
ARG COMMIT_MB
ARG COMMIT_MB_CALLFLOW
ARG COMMIT_MB_CONFERENCE

RUN apk update && apk add --no-cache \
	php5-apache2 git openssh php5 php5-curl php5-zlib php5-phar php5-json php5-openssl php5-pcntl bash procps coreutils grep curl jq tini
RUN delgroup $(getent group $DOCKER | cut -d: -f1) && addgroup -g $DOCKER docker && adduser -G docker -D -s /bin/bash user

USER user
WORKDIR /home/user

RUN git clone --depth 1 https://github.com/2600hz/docker kazoo-docker \
	&& git clone --depth 1 --branch $COMMIT_MB $REPO_MB make-busy \
	&& cd make-busy/ci \
	&& ./composer update \
	&& mkdir -p /home/user/tests \
	&& cd /home/user/tests \
	&& git clone --depth 1 --branch $COMMIT_MB_CALLFLOW $REPO_MB_CALLFLOW Callflow \
	&& git clone --depth 1 --branch $COMMIT_MB_CONFERENCE $REPO_MB_CONFERENCE Conference

COPY etc/make-busy.conf /etc/apache2/conf.d/make-busy.conf

WORKDIR /home/user/make-busy/ci
ENV HOME=$WORKDIR

COPY build/run.sh ./run.sh
COPY build/volume.sh ./volume.sh

USER root
ENTRYPOINT ["/sbin/tini", "--"]
CMD ./run.sh
