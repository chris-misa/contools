#
# Generate a docker container with traceroute
#
# The traceroute version in the debian repo seems ok so we use it.
# netbase included to support -A flag.
#
# 2018, Chris Misa
#

FROM debian:latest

RUN apt-get update
RUN apt-get install traceroute
RUN apt-get install netbase

COPY start.sh /
ENTRYPOINT ["/start.sh"]
