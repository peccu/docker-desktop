#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE:-$0}"); pwd)
cd $SCRIPT_DIR
[ -f .passwd ] || ./mkpasswd.sh
docker-compose build --build-arg uid=$UID --build-arg passwd=$(cat .passwd)
