#!/bin/bash
# bash "strict mode", see
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
IFS=$'\n\t'

if docker-compose version &>/dev/null; then
  COMPOSE=docker-compose
elif ! test -x docker-compose; then
  echo "This will download and run random software from the internet, proceed?"
  echo "Press Ctrl-C to abort, any key to proceed"
  read -r
  curl -L "https://github.com/docker/compose/releases/download/1.4.2/docker-compose-$(uname -s)-$(uname -m)" > docker-compose
  chmod +x docker-compose
  COMPOSE=./docker-compose
else
  COMPOSE=./docker-compose
fi

$COMPOSE -p sotaserver -f server.yml up -d
$COMPOSE -p sotadevice -f device.yml up -d
sleep 10
docker restart sotaserver_core_1
