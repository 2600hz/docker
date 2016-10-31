#!/bin/sh
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\DeviceTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ParkingTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\QuickCallTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\RingGroupTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\UserTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\VoicemailTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ConferenceTest:'
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\WebhookTest:'
