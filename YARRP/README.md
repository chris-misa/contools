# YARRP

A debian-based container for running yarrp.

# Usage

```
docker run --rm [-v ...] yarrp-debian <arguments> | batch <script>
```

Pass normal arguments to yarrp after container name
or use `batch <script>` to execute a (bash) script in the container.

Since yarrp does not like to use stdout, the best way to
get data in and out is to bind-mount a local directory into the container
using `docker run -v <absolute path to local dir>:<path to new dir in container>` etc.
You then must hand yarrp the path where this dir is mounted in
the container using `-o <path in container to output file>`.
The same can be used to supply yarrp with a target list file for the -i flag and is used to pass the container a script under the `batch` option.

# Examples

```
docker run --rm -v $(pwd)/localDir:/data yarrp-debian -o /data/test.yrp 172.17.0.1/24
```
    will write results of yarrping the subnet 172.17.0.1/24 to the file /data/test.yrp
    inside the container which corresponds to the the file ./localDir/test.yrp
    outside the container.

```
docker run --rm -v $(pwd)/tests:/tests yarrp-debian batch /tests/test1.sh
```
    will run the script stored localy at ./tests/test1.sh in the container.

# Notes

Downloads and build the source found at:
  https://www.cmand.org/yarrp/yarrp-0.4.tar.gz

# Dependencies:

zlib.h: zlib1g-dev in ubuntu and debian

cperm.h: https://github.com/lancealt/libcperm (build and install)
  autoconf
  automake
  libtool
