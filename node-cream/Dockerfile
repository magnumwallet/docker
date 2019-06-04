FROM debian:9.7

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

RUN apt-get update && apt-get install -y git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev libzmq3-dev mc nano

WORKDIR /opt
RUN git clone https://github.com/creamcoin/cream.git
RUN mv cream node

WORKDIR /opt/node
RUN ./autogen.sh
RUN ./configure --without-gui --with-incompatible-bdb
RUN make -j$(nproc)

RUN mkdir /opt/node/bin
RUN ln -s /opt/node/src/creamd /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]