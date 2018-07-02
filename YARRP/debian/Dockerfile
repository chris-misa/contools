#
# Generate a docker container with yarrp
#
# For documentation see readme file.
#
# 2018, Chris Misa
#

FROM debian:latest

# Install build tools
RUN apt-get update
RUN apt-get install -y gcc make wget git autoconf automake libtool zlib1g-dev

# Download, build, and install libcperm
RUN git clone https://github.com/lancealt/libcperm
WORKDIR libcperm
RUN ./autogen.sh
RUN ./configure
RUN make && make install
WORKDIR ..

RUN apt-get install -y g++

# Download, build, and install yarrp
RUN wget https://www.cmand.org/yarrp/yarrp-0.4.tar.gz
RUN tar xvf yarrp-0.4.tar.gz
WORKDIR yarrp-0.4
RUN ./configure
RUN make
RUN make install

# Update environment for dynamic linking
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# Set entry point
COPY start.sh /
ENTRYPOINT ["/start.sh"]
