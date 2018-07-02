#!/bin/bash

#
# owping batch test for owamp container
#
# 2018, Chris Misa
#

owping -c 4 172.17.0.2
owping -c 10 -F /tests/test1_results 172.17.0.2
