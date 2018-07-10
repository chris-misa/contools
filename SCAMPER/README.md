# Scamper

A debian-based container for running scamper.

# Usage

```
docker run --rm [-v ...] scamper-debian batch <script> | <arguments>
```

If `batch` immediately follows the container name, then the container
executes the (bash) script mounted in at `<script>`.
Else the container passes the remaining arguments to scamper
and sends the results to stdout.

# Examples

# Slimmification

Dependencies removed by docker-slim and manually added:
1. /etc/ld.so.cache
2. /etc/nsswitch.conf
3. /etc/passwd
4. /var/
5. /etc/localtime
6. /etc/resolv.conf
7. /etc/hosts

# Notes

Uses the default version of scamper found in the debian repository.
