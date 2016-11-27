#FROM debian:jessie
FROM tklx/base:0.1.1
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override this (if needed) with run --env option
ENV NETWORK=kazoo
ENV RABBITMQ=rabbitmq.$NETWORK

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

USER root
WORKDIR "/root"

COPY etc/deps /root/deps
RUN cp /usr/local/sbin/apt-clean /usr/bin && rm -rf /usr/local
COPY kamailio/bin /usr/local
COPY kamailio/etc /etc/kamailio
COPY kamailio/run.sh /root/
COPY kamailio/config-local.sh /root/

RUN groupadd kamailio \
	&& useradd --home-dir /var/run/kamailio -g kamailio kamailio \
	&& apt-get -y update \
	&& apt-get -y install $(cat /root/deps) \
	&& apt-get -y clean \
	&& apt-clean --aggressive 

ENTRYPOINT [ "./run.sh" ]
