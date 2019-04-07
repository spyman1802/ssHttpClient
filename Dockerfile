FROM alpine
MAINTAINER Spyman <spyman1802@gmail.com>

# install and config
RUN apk add privoxy py-pip \
    && echo "forward-socks5   /               127.0.0.1:1080 ." >> /etc/privoxy/config \
    && pip install shadowsocks \
    && sed -i "s/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g" /usr/lib/python2.7/site-packages/shadowsocks/crypto/openssl.py \
    && sed -i "s/listen-address  127.0.0.1:8118/listen-address  0.0.0.0:8118/g" /etc/privoxy/config

ENV SS_SERVER 0.0.0.0
ENV SS_PORT 1080
ENV SS_PASSWORD password
ENV SS_METHOLD aes-256-cif

EXPOSE 8118

CMD sslocal -s $SS_SERVER -p $SS_PORT -k $SS_PASSWORD -m $SS_METHOLD -d start & privoxy --no-daemon /etc/privoxy/config

