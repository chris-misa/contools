#!/bin/bash

#
# Test script for scamper container's batch function
#

scamper -i 172.217.3.206 > /tests/test1_results
scamper -c ping -i 172.217.3.206 >> /tests/test1_results
