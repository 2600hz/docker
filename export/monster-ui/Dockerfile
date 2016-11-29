FROM nginx:1.10-alpine
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override this (if needed) with run --env option
ENV NETWORK=kazoo
ENV KAZOO=kazoo.kazoo

ADD monster-ui.tar /usr/share/nginx/html
COPY build/run.sh /root/run.sh

ENTRYPOINT /root/run.sh
