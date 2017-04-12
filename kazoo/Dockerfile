FROM alianza-alianza-docker.jfrog.io/kazoo/erlang 
MAINTAINER Roman Galeev <jamhed@2600hz.com>

# override this (if needed) with run --env option
ENV NETWORK=kazoo
ENV NODE_NAME=kazoo
ENV KAZOO_APPS=sysconf,blackhole,callflow,cdr,conference,crossbar,fax,hangups,media_mgr,milliwatt,omnipresence,pivot,registrar,reorder,stepswitch,teletype,trunkstore,webhooks,ecallmgr
ENV COUCHDB=couchdb.$NETWORK
ENV RABBITMQ=rabbitmq.$NETWORK

ARG REPO=https://github.com/alianza-dev/alz-kazoo.git
ARG SKIP_BUILD=""
ARG UID
ARG GID
ARG PROD_BUILD

COPY repo /home/user/
USER root
RUN chown -R user.user kazoo
USER user

COPY etc/commit /home/user/commit
COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY etc/config.ini config.ini
COPY build/run.sh run.sh
ENTRYPOINT ./run.sh

ENV PATH $PATH:/home/user/bin
COPY build/sup bin/sup 

COPY build/cmd.sh ./cmd.sh

COPY build/setup_uid.sh build/setup_uid.sh
USER root
RUN build/setup_uid.sh
USER user

COPY etc/sys.config sys.config
COPY build/build.sh build/build.sh
RUN build/build.sh
