FROM debian:9.7
MAINTAINER Smirnov Dmitry <smdmitry@gmail.com>

SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y nano mc git build-essential libtool autotools-dev automake pkg-config \
libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev \
libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev libzmq3-dev libboost1.48-* libboost-system-dev \
libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev \
scrypt zlib1g-dev wget curl mc nano libunbound-dev libcurl4-openssl-dev libssl1.0-dev \
git build-essential libtool autotools-dev automake pkg-config libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev libzmq3-dev libboost1.48-* libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev scrypt mc nano telnet libgmp-dev \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/jl777/komodo && cd komodo && git checkout e159b4e

WORKDIR /opt/komodo
RUN ./zcutil/fetch-params.sh
RUN ./zcutil/build.sh -j$(nproc)

RUN ln -sf /opt/komodo/src/komodo-cli /usr/local/bin/komodo-cli
RUN ln -sf /opt/komodo/src/komodod /usr/local/bin/komodod

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]