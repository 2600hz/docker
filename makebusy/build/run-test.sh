#!/bin/bash
cd /var/www/html/make-busy
echo > /tmp/makebusy.log 
vendor/bin/phpunit --debug -v $@
