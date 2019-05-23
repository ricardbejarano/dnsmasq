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


## Building

To build the `glibc`-based image:

```bash
docker build -t dnsmasq:glibc -f glibc/Dockerfile .
```

To build the `musl`-based image:

```bash
docker build -t dnsmasq:musl -f musl/Dockerfile .
```


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
