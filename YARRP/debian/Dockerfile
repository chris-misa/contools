#
# Generate a docker container with yarrp
#
# Downloads and build the source found at:
#   https://www.cmand.org/yarrp/yarrp-0.4.tar.gz
#
# Usage:
#   Pass normal arguments to yarrp after container name.
#   Since yarrp does not like to use stdout, the best way to
#   get data in and out is to bind-mount a local directory into the container
#   using docker run -v <absolute path to local dir>:<path to new dir in container> etc.
#   You then must hand yarrp the path where this dir is mounted in
#   the container using -o <path in container to output file>.
#   The same can be used to supply yarrp with a target list file for the -i flag.
#
# Example:
#   docker run --rm -v $(pwd)/localDir:/data yarrp-debian -o /data/test.yrp 172.17.0.1/24
#       will write results of yarrping the subnet 172.17.0.1/24 to the file /data/test.yrp
#       inside the container which corresponds to the the file ./localDir/test.yrp
#       outside the container.
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

# Update environment for dynamic linking
ENV LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# Set entry point
ENTRYPOINT ["/yarrp-0.4/yarrp"]
