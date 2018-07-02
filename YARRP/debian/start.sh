#!/bin/bash

#
# Entrypoint for yarrp containers
#
# For documentation see readme file.
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] yarrp-debian <yarrp arguments> | batch <script>"

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
  yarrp $@
  echo "Yarrp returned $?"
fi
