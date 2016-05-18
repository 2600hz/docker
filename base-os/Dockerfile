FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

RUN apt update \
	&& apt upgrade \
	&& apt install -y --force-yes vim curl wget git \
	&& apt-get autoremove \
	&& apt-get clean