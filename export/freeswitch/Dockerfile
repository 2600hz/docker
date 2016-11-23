FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ENV DEBIAN_FRONTEND noninteractive
ENV APT_LISTCHANGES_FRONTEND=none

COPY etc/deps /root/deps
COPY etc/sources.list /etc/apt/sources.list
COPY etc/freeswitch.key.gpg /root/freeswitch.key.gpg
COPY freeswitch /usr/local/freeswitch
RUN addgroup freeswitch \
	&& adduser --disabled-password  --quiet --system --home /usr/local/freeswitch --ingroup freeswitch freeswitch \
	&& cat /root/freeswitch.key.gpg | apt-key add - \
	&& apt-get -y update \
	&& apt-get -y install $(cat /root/deps) \
	&& apt-get -y clean \
	&& chown -R freeswitch:freeswitch /usr/local/freeswitch

USER freeswitch
WORKDIR "/usr/local/freeswitch"
ENTRYPOINT [ "./run.sh" ]
