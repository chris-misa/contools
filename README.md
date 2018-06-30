# Containerized wrappings of internet measurement tools

This repo contains only dockerfiles for setting up 'fat' images of select tools.
These 'fat' images are to be run through docker-slim to produce lean, quick deployments
of a standard toolset.

# Tools

- [x] ping
- [x] owamp
- [x] traceroute
- [ ] scamper
- [x] yarrp
- [x] iperf

# Notes

So far tools mostly use command line for specifying all options input to the tool
and whatever the docker daemon connects to the container's stdout for output.
In the future it might be desirable to implement a flag which would cause output to
be written directly to a file in the container's fs because stdout might not
be reliable in all container contexts.

Only owamp runs ntpd to synchronize the container's clock to network time.
Perhaps all containers should do this?
