FROM klaemo/couchdb:2.0.0
MAINTAINER Roman Galeev <jamhed@2600hz.com>

COPY etc/local.ini /usr/local/etc/couchdb/local.ini
RUN echo "change_me" > /opt/couchdb/.erlang.cookie
RUN chown couchdb:couchdb /opt/couchdb/.erlang.cookie
RUN chmod 600 /opt/couchdb/.erlang.cookie
