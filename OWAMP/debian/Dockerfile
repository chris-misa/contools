#
# Generate a docker container with owamp tools.
# Used as a base container for owampd and owping containers.
#
# The container can then be run either as the owampd daemon
# or as owping client.
#
# 2018, Chris Misa
#

FROM debian:latest

# _DIR and _FILE are concatenated into the full path to the source tarball
ENV OWAMP_SOURCE_DIR http://software.internet2.edu/sources/owamp/
ENV OWAMP_SOURCE_FILE owamp-3.4-10.tar.gz

# Set up build dependencies
RUN apt-get update
RUN apt-get install -y gcc make wget libi2util-dev

# Download the source and un-tar into a working directory
RUN wget ${OWAMP_SOURCE_DIR}${OWAMP_SOURCE_FILE}
RUN mkdir owamp
RUN tar xvf ${OWAMP_SOURCE_FILE} -C owamp
WORKDIR owamp

# Set up dirs for storing owampd info and temporary files
RUN mkdir info && mkdir temp

# Configure, make, and install
RUN cd owamp-* && ./configure && make && make install


# ---------------- CACHE POINT ----------------------
RUN apt-get install -y i2util-tools
COPY owampd.* ./

# Just give a bash -- manual interaction with container for now
ENTRYPOINT ["/bin/bash"]
