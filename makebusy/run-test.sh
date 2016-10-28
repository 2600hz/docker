#!/bin/sh
./reset-kazoo.sh
echo Waiting for kazoo to start
watch -g "docker logs kazoo.kazoo | grep 'auto-started kapps'" > /dev/null
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\DeviceTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ParkingTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\QuickCallTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\RingGroupTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\UserTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\VoicemailTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ConferenceTest:'
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\WebhookTest:'
