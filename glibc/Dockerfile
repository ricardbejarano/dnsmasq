FROM debian AS build

ARG DNSMASQ_VERSION="2.80"
ARG DNSMASQ_CHECKSUM="9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"

ADD http://www.thekelleys.org.uk/dnsmasq/dnsmasq-$DNSMASQ_VERSION.tar.gz /tmp/dnsmasq.tar.gz

RUN if [ "$DNSMASQ_CHECKSUM" != "$(sha256sum /tmp/dnsmasq.tar.gz | awk '{print $1}')" ]; then exit 1; fi && \
    tar -C /tmp -xf /tmp/dnsmasq.tar.gz && \
    mv /tmp/dnsmasq-$DNSMASQ_VERSION /tmp/dnsmasq

RUN cd /tmp/dnsmasq && \
      apt update && \
      apt install -y gcc make && \
      make \
        CFLAGS="-fstack-protector-all" \
        LDFLAGS="-z relro -z now"


FROM scratch

COPY --from=build /lib/x86_64-linux-gnu/libc.so.6 \
                  /lib/x86_64-linux-gnu/libnss_files.so.2 \
                  /lib/x86_64-linux-gnu/
COPY --from=build /lib64/ld-linux-x86-64.so.2 /lib64/
COPY --from=build /tmp/dnsmasq/src/dnsmasq /

COPY rootfs /

WORKDIR /
EXPOSE 53/udp
ENTRYPOINT ["/dnsmasq"]
CMD ["--keep-in-foreground", "--user=dnsmasq"]
