<p align=center><img src=https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/320/apple/155/performing-arts_1f3ad.png width=120px></p>
<h1 align=center>dnsmasq (Docker image)</h1>
<p align=center>Built-from-source container image of the <a href=http://www.thekelleys.org.uk/dnsmasq/doc.html>Dnsmasq DNS forwarder</a></p>

Available at [`ricardbejarano/dnsmasq`](https://hub.docker.com/r/ricardbejarano/dnsmasq).


## Tags

[`2.80`, `latest` *(Dockerfile)*](https://github.com/ricardbejarano/dnsmasq/blob/master/Dockerfile)


## Features

* Super tiny (only `~2.26MB`)
* Built from source
* Built from `scratch`, see the [Filesystem](#Filesystem) section below for an exhaustive list of the image's contents
* Reduced attack surface (no `bash`, no UNIX tools, no package manager...)


## Filesystem

The images' contents are:

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


## License

See [LICENSE](https://github.com/ricardbejarano/dnsmasq/blob/master/LICENSE).
