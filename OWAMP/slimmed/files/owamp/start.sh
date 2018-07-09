#!/bin/bash

#
# Entrypoint for owamp container
#
# For documentation see readme
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] owamp-debian [daemon | owping] [program arguments]"

# Check for atleast one argument
if [ $# -lt 1 ]
then
  echo $USAGE
  exit 1
fi

# Make sure there is a /tmp directory
mkdir -p /tmp

# Select and run requested mode
case $1 in
daemon)
  shift
  owampd -f -Z -c /owamp $@
  echo "owampd exited with status $?"
  ;;
owping)
  shift
  owping $@
  echo "owping exited with status $?"
  ;;
batch)
  if [ -z "$2" ]
  then
    echo $USAGE
    exit 1
  else
    $2
    echo "Script returned $?"
  fi
  ;;
*)
  echo $USAGE
  exit 1
  ;;
esac
