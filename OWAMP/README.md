# OWAMP (owampd and owping)

A debian-based container for running owampd or owping.

# Usage

```
docker run --rm [-v ...] owamp-debian FUNCTION <arguments>
```

FUNCTION:
* `daemon` start container as owampd
* `owping` start container as owping
* `batch <script>` run `<script>` in the container

All subsequent arguments are handed to whichever
program is selected.
Results are returned through container's stdio unless `batch` is selected
in which case the script is responsible for managing results.

# Examples

Launch a container as the daemon:
```
docker run -d -p 861:5000 owamp-debian daemon
```

Run an owping session from a container (supposing an owampd is running at the given ip):
```
docker run --rm owamp-debian owping -c 4 172.17.0.2
```

Execute a test script in the local file ./tests/test1.sh:
```
docker run --rm -v $(pwd)/tests:/tests owamp-debian batch /tests/test1.sh
```

# Daemon-mode Notes
  The daemon is launched as root (using -f) so we are relying on
  security and isolation provided by container system!
  Also, we use -Z to launch in foreground and keep the container
  from exiting.
  Apparently owampd is capable of running sessions directly through the default port (861)
  so we don't need to expose a full range of testing ports on the container.
  There is probably a tradeoff here: exposing a large number of ports slows down docker
  and causes problems but forcing all owamp traffic through a single port probably
  slows down the owping session.

# Notes

Downloads and builds the source found at:
  http://software.internet2.edu/sources/owamp/owamp-3.4-10.tar.gz

Running daemon as root (insecure ?) with -f.
Running daemon in foreground (debug -> slower ?) with -Z.
