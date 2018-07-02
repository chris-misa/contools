# Iperf

A debian-based container for running iperf

# Usage
```
docker run --rm [-v ...] iperf-debian batch <script> | <args for iperf>
```

If `batch` immediately follows the container name, then the container
executes the (bash) script mounted in at `<script>`.
Else the container passes the remaining arguments to iperf
and sends the results to stdout.

# Examples

Start an iperf server container:
```
docker run --rm -id iperf-debian -s
```

Run an iperf session from client container:
```
docker run --rm iperf-debian -c 172.17.0.2 
```

Execute a batch script:
```
docker run --rm -v $(pwd)/tests:/tests iperf-debian batch /tests/test1.sh
```


# Notes

Uses standard build from apt repo
