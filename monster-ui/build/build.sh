#!/bin/sh -e
cd $WWW/html
git pull
gulp build-prod
