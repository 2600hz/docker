FROM docker
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG TOKEN
ARG DOCKER
EXPOSE 80

RUN apk update && apk add --no-cache \
	php5-apache2 git openssh php5 php5-curl php5-zlib php5-phar php5-json php5-openssl php5-pcntl bash procps coreutils grep curl jq
RUN delgroup $(getent group $DOCKER | cut -d: -f1) && addgroup -g $DOCKER docker && adduser -G docker -D -s /bin/bash user

USER user
WORKDIR /home/user

RUN git clone https://github.com/2600hz/docker ./kazoo-docker \
	&& git clone https://github.com/2600hz/make-busy ./make-busy \
	&& cd make-busy/ci \
	&& ./composer update \
	&& mkdir -p /home/user/tests \
	&& cd /home/user/tests \
	&& git clone https://$TOKEN@github.com/2600hz/make-busy-callflow.git ./Callflow \
	&& git clone https://$TOKEN@github.com/2600hz/make-busy-conference.git ./Conference

COPY etc/make-busy.conf /etc/apache2/conf.d/make-busy.conf

WORKDIR /home/user/make-busy/ci
ENV HOME=$WORKDIR

COPY etc/make-busy.commit ./make-busy.commit
COPY etc/make-busy-callflow.commit ./make-busy-callflow.commit
COPY etc/make-busy-conference.commit ./make-busy-conference.commit
COPY build/checkout.sh build/checkout.sh
RUN build/checkout.sh
COPY build/run.sh ./run.sh
COPY build/volume.sh ./volume.sh

USER root
ENTRYPOINT ./run.sh
