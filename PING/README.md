# Ping

A debian-based container for running ping.

# Usage

```
docker run --rm [-v ...] ping-debian batch <script> | <args for ping>
```

If `batch` immediately follows the container name, then the container
executes the (bash) script mounted in at `<script>`.
Else the container passes the remaining arguments to ping
and sends the results to stdout.

# Examples

Ping google.com four times:
```
docker run --rm ping-debian -c 4 google.com
```

Run the commands found in the local file ./tests/test1.sh:
```
docker run --rm -v $(pwd)/tests:/tests ping-debian batch /tests/test1.sh
```

# Slimification

ipv6 remains untested in slim container.

# Notes

Since there seem to be many, perhaps differing implementations of ping,
we pull and build the version bundled at https://github.com/iputils/iputils.git.

Make dependencies for debian:
  git, gcc, make
  libcap-dev
  libidn2-0-dev
  nettle-dev
