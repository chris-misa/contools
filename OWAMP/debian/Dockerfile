#
# Generate a docker container with owamp tools.
#
# Downloads and builds the source found at:
#   http://software.internet2.edu/sources/owamp/owamp-3.4-10.tar.gz
#
# Usage:
#   First argument after container name specifies behavior:
#     daemon  :  start container as owampd
#     owping  :  start container as owping
#
#   All subsequent arguments are handed to whichever
#   program is selected.
#   Results are returned through container's stdio.
#
#
# Daemon-mode Notes:
#   The daemon is launched as root (using -f) so we are relying on
#   security and isolation provided by container system!
#   Also, we use -Z to launch in foreground and keep the container
#   from exiting.
#   Apparently owampd is capable of running sessions directly through the default port (861)
#   so we don't need to expose a full range of testing ports on the container.
#   There is probably a tradeoff here: exposing a large number of ports slows down docker
#   and causes problems but forcing all owamp traffic through a single port probably
#   slows down the owping session.
#
# Examples:
#   Launch a container as the daemon:
#     docker run -d -p 861:5000 owamp-debian daemon
#
#   Run an owping session from a container (supposing an owampd is running at the given ip):
#     docker run owamp-debian owping -c 4 172.17.0.2
#
# 2018, Chris Misa
#

FROM debian:latest

# _DIR and _FILE are concatenated into the full path to the source tarball
ENV OWAMP_SOURCE_DIR http://software.internet2.edu/sources/owamp/
ENV OWAMP_SOURCE_FILE owamp-3.4-10.tar.gz

# Set up build dependencies
RUN apt-get update
RUN apt-get install -y gcc make wget libi2util-dev i2util-tools

# Download the source and un-tar into a working directory
RUN wget ${OWAMP_SOURCE_DIR}${OWAMP_SOURCE_FILE}
RUN mkdir owamp
RUN tar xvf ${OWAMP_SOURCE_FILE} -C owamp
WORKDIR owamp

# Set up dirs for storing owampd info and temporary files
RUN mkdir info && mkdir temp

# Copy in configuration files for owampd
COPY owampd.* ./

# Configure, make, and install
RUN cd owamp-* && ./configure && make && make install

# Install ntp
RUN apt-get install -y ntp

# Copy in and execute entrypoint script
COPY start.sh ./
ENTRYPOINT ["./start.sh"]
