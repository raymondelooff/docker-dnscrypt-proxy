FROM alpine:latest AS builder

WORKDIR /root/

RUN apk --no-cache add tar

ENV DNSCRYPT_PROXY_VERSION 2.0.42

ADD https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/$DNSCRYPT_PROXY_VERSION/dnscrypt-proxy-linux_x86_64-$DNSCRYPT_PROXY_VERSION.tar.gz .

RUN tar -xzf dnscrypt-proxy-linux_x86_64-$DNSCRYPT_PROXY_VERSION.tar.gz


FROM scratch

VOLUME /config

COPY --from=builder /root/linux-x86_64/dnscrypt-proxy /

CMD ["/dnscrypt-proxy"]
