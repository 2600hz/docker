FROM docker
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG TOKEN
ARG DOCKER
EXPOSE 8080

RUN apk update && apk add git openssh php5 php5-curl bash 
RUN delgroup $(getent group $DOCKER | cut -d: -f1) && addgroup -g $DOCKER docker && adduser -G docker -D -s /bin/bash user

USER user
WORKDIR /home/user

RUN git clone https://github.com/2600hz/docker ./kazoo-docker \
	&& git clone https://github.com/2600hz/make-busy ./make-busy \
	&&  mkdir tests && cd tests && git clone https://$TOKEN@github.com/2600hz/make-busy-callflow.git ./Callflow

WORKDIR /home/user/make-busy/ci
ENV HOME=$WORKDIR
ENTRYPOINT php -S 0.0.0.0:8080
