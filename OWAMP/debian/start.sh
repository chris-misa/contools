#!/bin/bash

#
# Entrypoint for owamp container
#
# For documentation see comments in the Dockerfile
#
# 2018, Chris Misa
#

USAGE="Usage: [docker commands] owamp-debian [daemon | owping] [program arguments]"

# Start ntp
/etc/init.d/ntp start

# Check for atleast one argument
if [ $# -lt 1 ]
then
  echo $USAGE
  exit 1
fi

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
*)
  echo $USAGE
  exit 1
  ;;
esac
