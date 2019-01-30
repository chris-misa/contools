#
# Generate a docker container with netperf and netserve
#
# 2019, Chris Misa
#

FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y texinfo automake make git gcc
RUN git clone https://github.com/HewlettPackard/netperf.git
WORKDIR netperf
RUN ./autogen.sh && ./configure && make && make install

ENTRYPOINT ["/bin/bash"]
