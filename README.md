# Containerized wrappings of internet measurement tools

This repo contains only dockerfiles for setting up 'fat' images of select tools.
These 'fat' images are to be run through docker-slim to produce lean, quick deployments
of a standard toolset.

# Tools

- [x] ping
- [x] owamp
- [x] traceroute
- [x] scamper
- [x] yarrp
- [x] iperf

# Notes

Only owamp runs ntpd to synchronize the container's clock to network time.
Perhaps all containers should do this?

# Planning

## Generic Scripting Interface

bash scripts are read and executed from a bind-mounted directory.

The entry point now looks like:
  1) if 'batch' flag is given, then execute script;
  2) else pass args as normal to command.
The script is responsible for deciding what to do with output data:
dumping on container's stdout or redirecting to a(nother) bind-mounted
directory.

## Generate Canonic Docker-slim Test-cases

These test cases should use all flags and functions of the tool so as to
maximally expose the tool's dependencies to docker-slim.
Given that there is a batch processing system, these test cases can be
specified on the command line of docker-slim using, perhaps, --cmd=...


