#
# Generate a docker container with scamper
#
# 2018, Chris Misa
#

FROM debian:latest

RUN apt-get update
RUN apt-get install -y scamper

COPY start.sh /
ENTRYPOINT ["/start.sh"]
