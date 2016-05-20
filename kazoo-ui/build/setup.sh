#!/bin/sh
rm -rf $WWW/html
mkdir -p $WWW/html
cd $WWW
git clone $REPO html
