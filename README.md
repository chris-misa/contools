# Containerized wrappings of internet measurement tools

This repo contains only dockerfiles for setting up 'fat' images of select tools.
These 'fat' images are to be run through docker-slim to produce lean, quick deployments
of a standard toolset.

# Progress

Batch-in-container
- [x] ping
- [x] owamp
- [x] traceroute
- [x] scamper
- [x] yarrp
- [x] iperf

# Notes

Only owamp runs ntpd to synchronize the container's clock to network time.
Perhaps all containers should do this?

Bash scripts can be read and executed from a bind-mounted directory.
See container's documention.

# Planning

## Generate Canonic Docker-slim Test-cases

These test cases should use all flags and functions of the tool so as to
maximally expose the tool's dependencies to docker-slim.
Given that there is a batch processing system, these test cases can be
specified on the command line of docker-slim using, perhaps, --cmd=...

## Experiements

What is the effect of a container on the system's ability to measure delay?

Host -> Network -> Host

Container -> Host -> Network -> Host

Possible Variables:
  1) Topography
  2) Network conditions
  3) Conditions in containerd

Measurements:
  1) Delay difference observed from in container compared with outside of container
  2) Re-enforce with timing data from strace
  3) Re-enforce with timing data from tcpdump
