#
# Generate a dedicated ping docker container image
#
# The version of ping in the debian repo seems off so we clone iputils
# and build a fresh version.
#
# 2018, Chris Misa
#

FROM debian:latest

RUN apt-get update
RUN apt-get install -y git gcc make libcap-dev libidn2-0-dev nettle-dev

RUN git clone https://github.com/iputils/iputils.git
WORKDIR iputils
RUN make

ENTRYPOINT ["./ping"]
