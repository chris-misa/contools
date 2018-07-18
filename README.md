# Containerized wrappings of internet measurement tools

This repo contains only dockerfiles for setting up 'fat' images of select tools.
Minified images are found at hub.docker.com/r/chrismisa/contools/

# Notes

Docker containers should be directly synchonized with the host's clock.
It is up to the host environment to provide accurate clocks for those
tests which might be sensitive to clock issues.

Bash scripts can be read and executed from a bind-mounted directory.
See container's documention.

# Experiemental Targets

## Time and Space Overheads

### Installed memory reqs
* Container:
  1. docker.io package size
  2. container image size
* Native:
  1. tool binary size
  2. (build framework size)
### Install time
* Container:
  1. apt-get install docker.io
  2. docker pull chrismisa/contools:\<container\>
* Native:
  1. apt-get install \<tool\>
OR
  2. download and make time . . . (highly variable)
### Running memory reqs
Over the execution time of the script
* Container:
  1. docker daemon system
  2. container running script
* Native:
  1. running script
### Running time
* Container:
  1. Starting daemon
  2. Starting container
  3. Running measurment script
  4. Stopping container
  5. Stopping daemon
* Native:
  1. Running measurement script

## Measurement Bias

### ping
* RTT

### owamp
* OWT

### traceroute
* RTT
* accuracy of trace

### yarrp
* accuracy of map
* ?

### iperf
* through put

### scamper
* RTT
* acuracy of trace
* ?
