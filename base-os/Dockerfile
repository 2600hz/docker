FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

COPY etc/sources.list /etc/apt

RUN apt update \
	&& apt upgrade \
	&& apt install -y --force-yes \
		vim curl wget git \
		erlang-nox erlang-src erlang-base-hipe erlang-dev erlang-eunit erlang-reltool \
	&& wget -O - http://files.freeswitch.org/repo/deb/debian/key.gpg | apt-key add - \
	&& apt-get clean

WORKDIR "/root"