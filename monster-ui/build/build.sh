#!/bin/sh
cd $WWW/html
git pull
gulp build-prod
