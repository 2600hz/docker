#!/bin/sh
rm -f tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\DeviceTest:' | tee -a tap.log
./reset-kazoo.sh 
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ParkingTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\QuickCallTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\RingGroupTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\UserTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\VoicemailTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\ConferenceTest:' | tee -a tap.log
./reset-kazoo.sh
docker exec -ti makebusy.kazoo ./run-test.sh '--filter Callflow\\WebhookTest:' | tee -a tap.log
tap/retap.pl tap.log
