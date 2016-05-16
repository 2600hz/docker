FROM debian:jessie
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY build/setup-os.sh /root/setup-os.sh
RUN /root/setup-os.sh

ENV HOME /home/user
ENV USERNAME user

RUN useradd -ms /bin/bash user

USER $USERNAME
WORKDIR $HOME

COPY build/setup-erlang.sh setup-erlang.sh
RUN ./setup-erlang.sh

USER root
COPY build/setup-spidermonkey.sh setup-spidermonkey.sh
RUN ./setup-spidermonkey.sh

USER $USERNAME
COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY build/build.sh build.sh
RUN ./build.sh