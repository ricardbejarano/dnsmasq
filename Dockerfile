FROM alpine:3 AS build

ARG VERSION="2.86"
ARG CHECKSUM="ef15f608a83ee2b1d1d2c1f11d089a7e0ac401ffb0991de73fc01ce5f290e512"

ADD http://www.thekelleys.org.uk/dnsmasq/dnsmasq-$VERSION.tar.gz /tmp/dnsmasq.tar.gz

RUN [ "$(sha256sum /tmp/dnsmasq.tar.gz | awk '{print $1}')" = "$CHECKSUM" ] && \
    apk add gcc linux-headers make musl-dev && \
    tar -C /tmp -xf /tmp/dnsmasq.tar.gz && \
    cd /tmp/dnsmasq-$VERSION && \
      make LDFLAGS="-static"

RUN mkdir -p /rootfs/bin && \
      cp /tmp/dnsmasq-$VERSION/src/dnsmasq /rootfs/bin/ && \
    mkdir -p /rootfs/etc && \
      echo "nogroup:*:10000:nobody" > /rootfs/etc/group && \
      echo "nobody:*:10000:10000:::" > /rootfs/etc/passwd


FROM scratch

COPY --from=build --chown=10000:10000 /rootfs /

USER 10000:10000
EXPOSE 1053/udp
ENTRYPOINT ["/bin/dnsmasq"]
CMD ["--keep-in-foreground", "--port=1053"]
