# Containerized wrappings of internet measurement tools

This repo contains only dockerfiles for setting up 'fat' images of select tools.
These 'fat' images are to be run through docker-slim to produce lean, quick deployments
of a standard toolset.

Minified images are collecting at: hub.docker.com/r/chrismisa/contools/

# Progress

Minified and pushed:
- [x] ping
- [x] owamp
- [x] traceroute
- [x] scamper
- [x] yarrp
- [x] iperf

# Notes

Docker containers should be directly synchonized with the host's clock.
It is up to the host environment to provide accurate clocks for those
tests which might be sensitive to clock issues.

Bash scripts can be read and executed from a bind-mounted directory.
See container's documention.

# Planning

## Generate Canonic Docker-slim Test-cases

These test cases should use all flags and functions of the tool so as to
maximally expose the tool's dependencies to docker-slim.
Given that there is a batch processing system, these test cases can be
specified on the command line of docker-slim using, perhaps, --cmd=...

## Experiements

### Container Impact

1. time and space overheads of container system
2. bias introduced on measurment
