#!/bin/bash

export NETWORK=${NETWORK:-"kazoo"}
ZONES=1
DB_NODES=3
FS_NODES=2
RB_NODES=1
LB_NODES=1

function confirm () {
	read -r -p "${1:-Are you sure? [y/N]} " response
	case $response in
	[yY][eE][sS]|[yY]) 
		true
		;;
	*)
		false
		;;
	esac
}

function createNetwork() {
	docker network create $NETWORK
}

function runCouchDb() {
	for ((n=1;n<=$DB_NODES;n++))
	do
		export NAME="db$n.$NETWORK"
		../couchdb2.0/run.sh
		until docker exec $NAME curl "http://127.0.0.1:5986" &> /dev/null
		do
			echo "Waiting for $NAME..."
			sleep 1
		done

		if [ "$n" -gt "1" ]
		then
			docker exec db1.$NETWORK curl -X PUT "http://127.0.0.1:5986/_nodes/couchdb@$NAME" -d {} &> /dev/null
		fi
  done

	docker exec db1.$NETWORK curl "http://127.0.0.1:5984/_membership"
}

function runFreeswitch() {
	for ((n=1;n<=$FS_NODES;n++))
	do
		export NAME="fs$n.$NETWORK"
		../freeswitch/run.sh
	done
}

function runRabbit() {
	for ((n=1;n<=$RB_NODES;n++))
	do
		export NAME="rb$n.$NETWORK"
		../rabbitmq/run.sh
	done
}

function runKamailio() {
	for ((n=1;n<=$LB_NODES;n++))
	do
		export NAME="lb$n.$NETWORK"
		../kamailio/run.sh

		for ((n=1;n<=$FS_NODES;n++))
		do
			export FREESWITCH="fs$n.$NETWORK"
			docker exec $NAME kamctl dispatcher add 1 sip:$FREESWITCH:11000 0 1 ' ' ' '
		done

		docker exec $NAME kamctl dispatcher show
	done
}

confirm "Create network $NETWORK [y/N]" && createNetwork
runCouchDb
runFreeswitch
runRabbit
runKamailio

# docker run -it -d -h app1.$NETWORK --name app1.$NETWORK -v /opt/projects/github/2600hz/kazoo:/opt/kazoo kazoo/erlang /opt/kazoo/scripts/dev-start-apps.sh
