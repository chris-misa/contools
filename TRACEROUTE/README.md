# Traceroute

A debian-based container for running traceroute.

# Usage

```
docker run --rm [-v ...] traceroute-debian batch <script> | <args for traceroute>
```

If `batch` immediately follows the container name, then the container
executes the (bash) script mounted in at `<script>`.
Else the container passes the remaining arguments to traceroute
and sends the results to stdout.

# Examples

Run traceroute to google.com:
```
docker run --rm traceroute-debian google.com
```

Run the commands found in the local file ./tests/test1.sh:
```
docker run --rm -v $(pwd)/tests:/tests traceroute-debian batch /tests/test1.sh
```

# Notes

Using the traceroute version found in the debian package repo
as it seems to conform with standard versions.

Need to install netbase for /etc/services to be setup properly
but docker-slim seems to strip this file.
The fix is to manually add a version of this file to the files/etc/
and re-build the slim container from the generated Dockerfile.
