#!/bin/bash
CID=$(docker ps | grep swift2byexample | awk '{print $1}')
echo ${CID}
docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${CID}
