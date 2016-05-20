FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

ENV BASH_ENV .bashrc

COPY etc/sources.list /etc/apt

USER root
WORKDIR /root
COPY build/setup-os.sh build/setup-os.sh
COPY etc/profile .bashrc
RUN build/setup-os.sh

WORKDIR /home/user

COPY build build
COPY etc/profile .bashrc

RUN chown user:user .bashrc \
	&& su -l -c build/setup-erlang.sh user \
	&& su -l -c build/setup-bin.sh user \
	&& su -l -c build/cleanup.sh user \
	&& rm -rf build

USER user
