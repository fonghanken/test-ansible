#!/bin/bash
tmpFile=/tmp/dkrContList.txt &&
docker ps -a | grep "$1" | awk '{print $1}' > $tmpFile &&
declare -a CON_LIST=$(cat $tmpFile) &&
CON_ARRAY=($CON_LIST) &&
if [ "${#CON_ARRAY[@]}" -ne 0 ]; then
	for container in "${CON_ARRAY[@]}"
	do
		docker rm -f "$container"
	done
else
    echo "There is no containers to clean up"
fi;