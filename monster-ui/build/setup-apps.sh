#!/bin/sh
cd $WWW/html/src/apps
for app in $APPS
do
	git clone --depth 1 --no-single-branch https://$TOKEN@github.com/2600hz/monster-ui-$app $app
done
