#!/bin/bash

#
# Entrypoint for iperf container
#
# For documentation see the readme file.
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] iperf-debian <iperf arguments> | batch <batch file>"

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
  iperf $@
  echo "Iperf returned $?"
fi
