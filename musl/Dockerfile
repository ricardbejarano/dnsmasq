FROM alpine AS build

ARG DNSMASQ_VERSION="2.80"
ARG DNSMASQ_CHECKSUM="9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"

ADD http://www.thekelleys.org.uk/dnsmasq/dnsmasq-$DNSMASQ_VERSION.tar.gz /tmp/dnsmasq.tar.gz

RUN cd /tmp && \
    if [ "$DNSMASQ_CHECKSUM" != "$(sha256sum /tmp/dnsmasq.tar.gz | awk '{print $1}')" ]; then exit 1; fi && \
    tar xf /tmp/dnsmasq.tar.gz && \
    mv /tmp/dnsmasq-$DNSMASQ_VERSION /tmp/dnsmasq

RUN cd /tmp/dnsmasq && \
      apk add gcc make musl-dev linux-headers && \
      make


FROM scratch

COPY --from=build /lib/ld-musl-x86_64.so.1 \
                  /lib/
COPY --from=build /tmp/dnsmasq/src/dnsmasq /dnsmasq

COPY rootfs /

USER dnsmasq:dnsmasq
WORKDIR /
EXPOSE 53/udp
ENTRYPOINT ["/dnsmasq"]
CMD ["--keep-in-foreground"]
