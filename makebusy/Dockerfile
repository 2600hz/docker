FROM php:5.6.27-apache
MAINTAINER Roman Galeev <jamhed@2600hz.com>

USER root
WORKDIR /root

COPY build/setup-os.sh build/setup-os.sh
RUN build/setup-os.sh

COPY etc/.ssh .ssh

COPY build/run.sh build/run.sh
COPY etc/config.json etc/config.json
COPY build/next-ip.pl build/next-ip.pl
COPY build/setup-ip.sh build/setup-ip.sh
COPY build/run-test.sh run-test.sh

COPY etc/commit commit
COPY build/setup.sh build/setup.sh
RUN build/setup.sh

COPY build/setup-tests.sh build/setup-tests.sh
RUN build/setup-tests.sh
