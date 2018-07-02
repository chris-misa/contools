#!/bin/bash

#
# Basic test of batch function of yarrp container
#
# 2018, Chris Misa
#

yarrp -o /tests/test1_1.yrp 10.0.0.0/24
yarrp -o /tests/test1_2.yrp -t ICMP 10.0.0.0/24
