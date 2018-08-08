#!/bin/bash

#
# Entrypoint for ping container
#
# For documentation see README.md
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] ping-ubuntu <ping arguments> | batch <batch file>"
PING_CMD="/iputils/ping"

if [ "$1" = "batch" ]
then
  if [ -z "$2" ]
  then
    echo $USAGE
    exit 1
  else
    $2
    echo "Script returned $?"
  fi
else
  $PING_CMD $@
  echo "Ping returned $?"
fi
