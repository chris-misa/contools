#
# Generate a docker container with ping
#
# See README.md for documentation
#
# 2018, Chris Misa
#

FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y git gcc make libcap-dev libidn2-0-dev nettle-dev

RUN git clone https://github.com/iputils/iputils.git
WORKDIR iputils
RUN make

RUN apt-get install -y strace

COPY start.sh /
ENTRYPOINT ["/start.sh"]
