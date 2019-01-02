FROM debian:stretch AS build

ARG DNSMASQ_VERSION="2.80"
ARG DNSMASQ_CHECKSUM="9e4a58f816ce0033ce383c549b7d4058ad9b823968d352d2b76614f83ea39adc"

WORKDIR /tmp
ADD http://www.thekelleys.org.uk/dnsmasq/dnsmasq-$DNSMASQ_VERSION.tar.gz /tmp/dnsmasq.tar.gz
RUN if [ "$DNSMASQ_CHECKSUM" != "$(sha256sum /tmp/dnsmasq.tar.gz | awk '{print $1}')" ]; then exit 1; fi && \
    tar xf /tmp/dnsmasq.tar.gz && \
    mv /tmp/dnsmasq-$DNSMASQ_VERSION /tmp/dnsmasq

WORKDIR /tmp/dnsmasq
RUN apt update && \
    apt install -y gcc make && \
    make


FROM gcr.io/distroless/base

COPY --from=build /tmp/dnsmasq/src/dnsmasq /dnsmasq

ENTRYPOINT ["/dnsmasq", "--keep-in-foreground", "--user=root"]
