<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/155/performing-arts_1f3ad.png width=120px></p>
<h1 align=center>dnsmasq (container image)</h1>
<p align=center>Built-from-source container image of the <a href=http://www.thekelleys.org.uk/dnsmasq/doc.html>Dnsmasq DNS forwarder</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/dnsmasq`](https://hub.docker.com/r/ricardbejarano/dnsmasq):

- [`2.80-glibc`, `2.80`, `glibc`, `master`, `latest` *(glibc/Dockerfile)*](https://github.com/ricardbejarano/dnsmasq/blob/master/glibc/Dockerfile)
- [`2.80-musl`, `musl` *(musl/Dockerfile)*](https://github.com/ricardbejarano/dnsmasq/blob/master/musl/Dockerfile)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/dnsmasq-glibc`](https://quay.io/repository/ricardbejarano/dnsmasq-glibc), tags: [`2.80`, `master`, `latest` *(glibc/Dockerfile)*](https://github.com/ricardbejarano/dnsmasq/blob/master/glibc/Dockerfile)
- [`quay.io/ricardbejarano/dnsmasq-musl`](https://quay.io/repository/ricardbejarano/dnsmasq-musl), tags: [`2.80`, `master`, `latest` *(musl/Dockerfile)*](https://github.com/ricardbejarano/dnsmasq/blob/master/musl/Dockerfile)


## Features

* Super tiny (`glibc`-based is `~2.26MB` and `musl`-based is (an astonishing) `~961kB`)
* Built from source
* Built `FROM scratch`, see the [Filesystem](#Filesystem) section below for an exhaustive list of the image's contents
* Reduced attack surface (no `bash`, no UNIX tools, no package manager...)
* Built with exploit mitigations enabled (see [Security](#Security))


## Building

To build the `glibc`-based image:

```bash
docker build -t dnsmasq:glibc -f glibc/Dockerfile .
```

To build the `musl`-based image:

```bash
docker build -t dnsmasq:musl -f musl/Dockerfile .
```


## Security

This image attempts to build a secure Dnsmasq container image.

It does so by the following ways:

- downloading and verifying the source code of Dnsmasq and every library it is built with,
- packaging the image with only those files required during runtime (see [Filesystem](#Filesystem)),
- by enforcing a series of exploit mitigations (PIE, full RELRO, full SSP, NX and Fortify)

### Verifying the presence of exploit mitigations

To check whether a binary in a container image has those mitigations enabled, use [tests/checksec.sh](https://github.com/ricardbejarano/dnsmasq/blob/master/tests/checksec.sh).

#### Usage

```
usage: checksec.sh docker_image executable_path

Container-based wrapper for checksec.sh.
Requires a running Docker daemon.

Example:

  $ checksec.sh ricardbejarano/dnsmasq:glibc /dnsmasq

  Extracts the '/dnsmasq' binary from the 'ricardbejarano/dnsmasq:glibc' image,
  downloads checksec (github.com/slimm609/checksec.sh) and runs it on the
  binary.
  Everything runs inside containers.
```

#### Example:

Testing the `/dnsmasq` binary in `ricardbejarano/dnsmasq:glibc`:

```
$ bash tests/checksec.sh ricardbejarano/dnsmasq:glibc /dnsmasq
Downloading ricardbejarano/dnsmasq:glibc...Done!
Extracting ricardbejarano/dnsmasq:glibc:/dnsmasq...Done!
Downloading checksec.sh...Done!
Running checksec.sh:
RELRO        STACK CANARY   NX           PIE           RPATH      RUNPATH      Symbols         FORTIFY   Fortified   Fortifiable   FILE
Full RELRO   Canary found   NX enabled   PIE enabled   No RPATH   No RUNPATH   784 Symbols     Yes       0           44            /tmp/.checksec-ui8eKi3Q
Cleaning up...Done!
```

This wrapper script works with any binary in a container image. Feel free to use it with any other image.

Other examples:

- `bash tests/checksec.sh debian /bin/bash`
- `bash tests/checksec.sh alpine /bin/sh`


## Filesystem

The images' contents are:

### `glibc`

Based on the [glibc](https://www.gnu.org/software/libc/) implementation of `libc`. Dynamically linked.

```
/
├── dnsmasq
├── etc/
│   ├── group
│   └── passwd
├── lib/
│   └── x86_64-linux-gnu/
│       ├── libc.so.6
│       └── libnss_files.so.2
├── lib64/
│   └── ld-linux-x86-64.so.2
└── var/
    └── run/
        └── .keep
```

### `musl`

Based on the [musl](https://www.musl-libc.org/) implementation of `libc`. Dynamically linked.

```
/
├── dnsmasq
├── etc/
│   ├── group
│   └── passwd
├── lib/
│   └── ld-musl-x86_64.so.1
└── var/
    └── run/
        └── .keep
```


## License

See [LICENSE](https://github.com/ricardbejarano/dnsmasq/blob/master/LICENSE).
