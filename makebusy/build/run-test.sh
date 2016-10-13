#!/bin/bash
cd /var/www/html/make-busy
echo > /tmp/makebusy.log 
echo > /tmp/makebusy.txt
vendor/bin/phpunit --debug -v | tee /tmp/makebusy.txt
