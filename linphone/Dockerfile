FROM kazoo/base-os
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
RUN apt-get install -y --force-yes linphone-nogtk && apt-get clean

COPY build/run.sh run.sh
ENTRYPOINT [ "./run.sh" ]
