FROM python:3.7-alpine3.7
#LABEL maintainer="Luke Childs <lukechilds123@gmail.com>"

COPY ./bin /usr/local/bin
COPY ./VERSION /tmp

RUN pip install --upgrade pip
RUN VERSION=$(cat /tmp/VERSION) && \
    chmod a+x /usr/local/bin/* && \
    apk add --no-cache git build-base openssl && \
    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main leveldb-dev && \
#    apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing rocksdb-dev && \
    pip install aiohttp pylru plyvel websockets && \
    pip install pyskein git+https://github.com/bitcoinplusorg/x13-hash pivx-quark-hash quark_hash x11_hash x16r-hash xevan-hash git+https://github.com/Jenova7/nist5_hash
RUN pip install groestlcoin_hash git+https://github.com/MicroBitcoinOrg/RainforestPython
RUN VERSION=$(cat /tmp/VERSION) && git clone -b $VERSION https://github.com/magnumwallet/electrumx.git && \
    cd electrumx && \
    python setup.py install

#    && \
#    apk del git build-base && \
#    rm -rf /tmp/*

VOLUME ["/data"]
ENV HOME /data
ENV ALLOW_ROOT 1
ENV DB_DIRECTORY /data
ENV SERVICES=tcp://:50001,ssl://:50002,wss://:50004,rpc://0.0.0.0:8000
ENV SSL_CERTFILE ${DB_DIRECTORY}/electrumx.crt
ENV SSL_KEYFILE ${DB_DIRECTORY}/electrumx.key
ENV HOST ""
#ENV DB_ENGINE "rocksdb"
WORKDIR /data

EXPOSE 50001 50002 50004 8000

CMD ["init"]