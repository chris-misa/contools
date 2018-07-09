#!/bin/bash

#
# Entrypoint for traceroute container
#
# For documentation see README.md
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] traceroute-debian <ping arguments> | batch <batch file>"

if [ "$1" = "batch" ]
then
  if [ -z "$2" ]
  then
    echo $USAGE
  else
    $2
    echo "Script returned $?"
  fi
else
  traceroute $@
  echo "Ping returned $?"
fi
