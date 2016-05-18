#!/bin/sh
git config --global pull.rebase true
git clone --depth 1 --no-single-branch https://freeswitch.org/stash/scm/fs/freeswitch.git freeswitch
cd freeswitch
./bootstrap.sh
./configure -C