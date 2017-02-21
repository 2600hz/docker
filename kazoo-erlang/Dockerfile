FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

ARG OTP
ARG KERL_URL

USER root

RUN apt-get install -y make python build-essential zip unzip libexpat-dev \
            unixodbc-dev libssh2-1-dev libssl-dev libncurses5-dev python
RUN apt-get -y clean

USER user

RUN curl -O -k $KERL_URL && chmod +x kerl
RUN ./kerl update releases \
    && ./kerl build $OTP $OTP
RUN ./kerl install $OTP erlang \
    && . erlang/activate \
    && ./kerl cleanup all
