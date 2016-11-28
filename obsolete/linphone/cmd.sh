#!/bin/bash
ID=$1
: ${ID:=1}
shift
docker exec -ti linphone$ID.kazoo linphonecsh "$@"
