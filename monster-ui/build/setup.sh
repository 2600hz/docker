#!/bin/sh
rm -rf $WWW/html
mkdir -p $WWW/html
cd $WWW
git clone $REPO html

echo "Setup public apps"
cd $WWW/html/apps
git clone https://github.com/2600hz/monster-ui-voip
git clone https://github.com/2600hz/monster-ui-webhooks
git clone https://github.com/2600hz/monster-ui-callflows
git clone https://github.com/2600hz/monster-ui-pbxs
git clone https://github.com/2600hz/monster-ui-numbers
