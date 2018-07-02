#!/bin/bash

#
# Simple test script for iperf container
#
# 2018, Chris Misa
#

iperf -c 172.17.0.2 > /tests/test1_results
iperf -c 172.17.0.3 >> /tests/test1_results
