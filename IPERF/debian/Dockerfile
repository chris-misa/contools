#
# Generate a docker container with iperf.
#
# See readme for documentation.
#
# 2018, Chris Misa
#

FROM debian:latest

RUN apt-get update
RUN apt-get install -y iperf

COPY start.sh /
ENTRYPOINT ["/start.sh"]
