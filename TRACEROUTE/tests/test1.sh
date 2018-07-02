#!/bin/bash

#
# Test for traceroute docker container's
# batch function
#

traceroute -m 5 google.com
traceroute -m 5 chrismisa.com
traceroute -m 5 amazon.com > /tests/amazon_results
