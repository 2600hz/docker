#!/bin/sh
rm -rf $WWW/html
mkdir -p $WWW/html
cd $WWW
git clone --depth 1 --no-single-branch $REPO html

echo "Setup public apps"
cd $WWW/html/apps

for app in accounts callflows numbers pbxs voip webhooks
do
	git clone --depth 1 --no-single-branch https://github.com/2600hz/monster-ui-$app $app
done
