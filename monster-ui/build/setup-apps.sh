#!/bin/sh -e

cd $WWW/html/src/apps
for app in $APPS
do
    git clone --depth 1 https://$TOKEN@github.com/2600hz/monster-ui-$app $app
done
