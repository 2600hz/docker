#!/bin/bash
DIR=${1:-"./"}
find $DIR | while read file
do
        objdump -p $file 2>/dev/null | grep NEEDED
done | while read a b; do echo $b; done | sort | uniq | while read file; do dpkg -S $file 2>/dev/null; done | cut -d: -f 1 | sort | uniq
