<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/155/performing-arts_1f3ad.png" width="120px"></p>
<h1 align="center">dnsmasq (container image)</h1>
<p align="center">Built-from-source container image of the <a href="http://www.thekelleys.org.uk/dnsmasq/doc.html">Dnsmasq DNS forwarder</a></p>


## Tags

### Docker Hub

Available on [Docker Hub](https://hub.docker.com) as [`ricardbejarano/dnsmasq`](https://hub.docker.com/r/ricardbejarano/dnsmasq):

- [`2.80-glibc`, `2.80`, `glibc`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/dnsmasq/blob/master/Dockerfile.glibc) (about `2.51MB`)
- [`2.80-musl`, `musl` *(Dockerfile.musl)*](https://github.com/ricardbejarano/dnsmasq/blob/master/Dockerfile.musl) (about `958kB`)

### Quay

Available on [Quay](https://quay.io) as:

- [`quay.io/ricardbejarano/dnsmasq`](https://quay.io/repository/ricardbejarano/dnsmasq), [`quay.io/ricardbejarano/dnsmasq-glibc`](https://quay.io/repository/ricardbejarano/dnsmasq-glibc), tags: [`2.80`, `master`, `latest` *(Dockerfile.glibc)*](https://github.com/ricardbejarano/dnsmasq/blob/master/Dockerfile.glibc) (about `2.51MB`)
- [`quay.io/ricardbejarano/dnsmasq-musl`](https://quay.io/repository/ricardbejarano/dnsmasq-musl), tags: [`2.80`, `master`, `latest` *(Dockerfile.musl)*](https://github.com/ricardbejarano/dnsmasq/blob/master/Dockerfile.musl) (about `958kB`)


## Features

* Super tiny (see [Tags](#tags))
* Compiled from source (with binary exploit mitigations) during build time
* Built `FROM scratch`, with zero bloat (see [Filesystem](#filesystem))
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

- To build the `glibc`-based image: `$ docker build -t dnsmasq:glibc -f Dockerfile.glibc .`
- To build the `musl`-based image: `$ docker build -t dnsmasq:musl -f Dockerfile.musl .`


## Filesystem

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
└── lib64/
    └── ld-linux-x86-64.so.2
```

### `musl`

Based on the [musl](https://www.musl-libc.org/) implementation of `libc`. Dynamically linked.

```
/
├── dnsmasq
├── etc/
│   ├── group
│   └── passwd
└── lib/
    └── ld-musl-x86_64.so.1
```


## License

See [LICENSE](https://github.com/ricardbejarano/dnsmasq/blob/master/LICENSE).
