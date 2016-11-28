#!/bin/sh
mkdir mk-bs
docker cp makebusy.kazoo:/var/www/html/make-busy/prompts/make-busy-media.tar.gz mk-bs/
cd mk-bs
tar zxvf make-busy-media.tar.gz
cd ../
docker cp mk-bs kazoo.kazoo:/home/user
./sup kazoo_media_maintenance import_prompts /home/user/mk-bs mk-bs
rm -rf mk-bs
docker exec --user root kazoo.kazoo rm -rf mk-bs
echo wait data to flush
sleep 5
docker commit couchdb.kazoo kazoo/couchdb-init-mkbs
