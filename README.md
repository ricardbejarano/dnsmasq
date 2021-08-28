<p align="center"><img src="https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/155/performing-arts_1f3ad.png" width="120px"></p>
<h1 align="center">dnsmasq (container image)</h1>
<p align="center">Built-from-source container image of the <a href="http://www.thekelleys.org.uk/dnsmasq/doc.html">Dnsmasq</a> network services</p>


## Tags

### Docker Hub

Available on Docker Hub as [`docker.io/ricardbejarano/dnsmasq`](https://hub.docker.com/r/ricardbejarano/dnsmasq):

- [`2.85`, `latest` *(Dockerfile)*](Dockerfile)

### RedHat Quay

Available on RedHat Quay as [`quay.io/ricardbejarano/dnsmasq`](https://quay.io/repository/ricardbejarano/dnsmasq):

- [`2.85`, `latest` *(Dockerfile)*](Dockerfile)


## Features

* Compiled from source during build time
* Built `FROM scratch`, with zero bloat
* Statically linked to the [`musl`](https://musl.libc.org/) implementation of the C standard library
* Reduced attack surface (no shell, no UNIX tools, no package manager...)
* Runs as unprivileged (non-`root`) user


## Building

```bash
docker build --tag ricardbejarano/dnsmasq --file Dockerfile .
```


## License

MIT licensed, see [LICENSE](LICENSE) for more details.
