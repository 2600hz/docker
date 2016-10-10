#!/bin/sh
cd /var/www/html/make-busy
mkdir -p tests/KazooTests/Applications
git clone git@github.com:2600hz/make-busy-conference.git tests/KazooTests/Applications/Conference
git clone git@github.com:2600hz/make-busy-callflow.git tests/KazooTests/Applications/Callflow
git clone git@github.com:2600hz/make-busy-crossbar.git tests/KazooTests/Applications/Crossbar
git clone git@github.com:2600hz/make-busy-trunkstore.git tests/KazooTests/Applications/Trunkstore
git clone git@github.com:2600hz/make-busy-konami.git tests/KazooTests/Applications/Konami

