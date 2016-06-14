#!/bin/sh
rm -rf $WWW/html
mkdir -p $WWW/html
cd $WWW
git clone $REPO html

echo "Setup public apps"
cd $WWW/html/apps
git clone https://github.com/2600hz/monster-ui-accounts accounts
git clone https://github.com/2600hz/monster-ui-callflows callflows
git clone https://github.com/2600hz/monster-ui-numbers numbers
git clone https://github.com/2600hz/monster-ui-pbxs pbxs
git clone https://github.com/2600hz/monster-ui-voip voip
git clone https://github.com/2600hz/monster-ui-webhooks webhooks
