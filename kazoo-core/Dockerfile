FROM kazoo/erlang
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

COPY build/setup.sh setup.sh
RUN ./setup.sh

COPY build/install.sh install.sh
RUN ./install.sh

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
