#!/bin/bash

#
# Entrypoint for ping container
#
# For documentation see README.md
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] ping-debian <ping arguments> | batch <batch file>"

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
  ping $@
  echo "Ping returned $?"
fi
