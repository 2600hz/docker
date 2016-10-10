FROM kazoo/kazoo
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
COPY build/cleanup.sh cleanup.sh
RUN ./cleanup.sh

USER user
