FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none
ENV BASH_ENV .bashrc

ENV TINI_VERSION v0.13.2
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

COPY etc/sources.list /etc/apt

USER root
WORKDIR /root
COPY build/setup-os.sh build/setup-os.sh
COPY etc/profile .bashrc
RUN build/setup-os.sh

WORKDIR /home/user

COPY build build
COPY etc/profile .bashrc

RUN chown user:user .bashrc

USER user

ENTRYPOINT ["/tini", "--"]
