#!/bin/sh -e

rm -rf $WWW/html
mkdir -p $WWW/html
cd $WWW
git clone --depth 1 --branch $COMMIT_MONSTER $REPO html

echo Setup node
cd $WWW/html
npm install
npm -g install gulp

echo Setup public apps
cd $WWW/html/src/apps

for app in accounts callflows numbers pbxs voip webhooks fax voicemails
do
    git clone --depth 1 --no-single-branch https://github.com/2600hz/monster-ui-$app $app
done
