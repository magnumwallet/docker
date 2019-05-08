FROM python:3.7-alpine3.7
#LABEL maintainer="Luke Childs <lukechilds123@gmail.com>"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp

RUN VERSION=$(cat /tmp/VERSION) && \
    chmod a+x /usr/local/bin/* && \
    apk add --no-cache git build-base openssl && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community leveldb-dev && \
    pip install aiohttp aiorpcX ecdsa plyvel pycodestyle pylru pyrocksdb pytest-asyncio pytest-cov Sphinx && \
    pip install tribus-hash blake256 scrypt x11_hash xevan_hash && \
    pip install quark_hash groestlcoin_hash neoscrypt x16r_hash pycryptodomex && \
    pip install git+https://github.com/Electra-project/nist5_hash && \
    pip install git+https://github.com/bitcoinplusorg/x13-hash && \
    git clone -b $VERSION https://github.com/magnumwallet/electrumx.git && \
    cd electrumx && \
    python setup.py install && \
    apk del git build-base && \
    rm -rf /tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV ALLOW_ROOT 1
ENV DB_DIRECTORY /data
ENV TCP_PORT=50001
ENV SSL_PORT=50002
ENV SSL_CERTFILE ${DB_DIRECTORY}/electrumx.crt
ENV SSL_KEYFILE ${DB_DIRECTORY}/electrumx.key
ENV HOST ""
WORKDIR /data

EXPOSE 50001 50002

CMD ["init"]