#FROM debian:jessie
FROM tklx/base:0.1.1
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override this (if needed) with run --env option
ENV NETWORK=kazoo
ENV NODE_NAME=kazoo
ENV KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
ENV COUCHDB=couchdb.$NETWORK
ENV RABBITMQ=rabbitmq.$NETWORK

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

COPY etc/deps /root/deps
ADD kazoo.tar /home/user
COPY build/run.sh /home/user
RUN groupadd user \
	&& useradd -g user user \
	&& apt-get -y update \
	&& apt-get -y install $(cat /root/deps) \
	&& apt-clean --aggressive \
	&& chown user:user /home/user && chown user:user /home/user/run.sh

ENV PATH=$PATH:/home/user
USER user
WORKDIR "/home/user"
ENTRYPOINT [ "./run.sh" ]
