#!/bin/bash

#
# A test for the ping-debian container's
# `batch` function.#
#

ping -c 4 google.com
ping -c 4 facebook.com
ping -c 4 amazon.com > /tests/amazon_results
