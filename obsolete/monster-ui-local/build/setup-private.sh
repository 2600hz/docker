#!/bin/sh
cp -a etc/.ssh /root/.ssh
chown -R root:root ~/.ssh
echo "Setup private apps"
cd $WWW/html/apps

for app in conferences fax debug callqueues operator websockets dialplans voicemails pivot userportal mobile provisioner cluster branding reporting port migration carriers inspector dashboard
do
	git clone --depth 1 --no-single-branch git@github.com:2600hz/monster-ui-$app $app
done
