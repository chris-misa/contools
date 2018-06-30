#
# Generate a docker container with iperf.
#
# Uses standard build from apt repo
#
# Usage:
#   Added arguments to iperf as normal after container name.
#
# Examples:
#
#   Start an iperf server container:
#     docker run --rm -id iperf-debian -s
#
#   Run an iperf session from client container:
#     docker run --rm iperf-debian -c 172.17.0.2 
#
# 2018, Chris Misa
#

FROM debian:latest

RUN apt-get update
RUN apt-get install -y iperf

ENTRYPOINT ["iperf"]
