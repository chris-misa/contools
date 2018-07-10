#!/bin/bash

#
# Entrypoint for scamper container
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] scamper-debian <arguments> | batch <batch file>"

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
  scamper $@
  echo "scamper returned $?"
fi
