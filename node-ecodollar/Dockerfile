FROM debian:9.7

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

RUN apt-get update && apt-get install -y git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev libdb-dev libdb++-dev libzmq3-dev libboost1.48-* libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev scrypt mc nano \
libgmp-dev

# https://github.com/SlashCoreProject/slash/issues/1

# ----

WORKDIR /opt
RUN git clone https://github.com/EcoDollar/EcoDollar.git
RUN mv EcoDollar node

RUN git clone https://github.com/PIVX-Project/PIVX.git
RUN cp -r PIVX/build-aux /opt/node/build-aux
RUN mv PIVX/build-aux /opt/node/src/build-aux

WORKDIR /opt/node
RUN ./autogen.sh
RUN ./configure --without-gui --with-incompatible-bdb --disable-tests --enable-cxx --disable-shared --with-pic --prefix=/opt/node
RUN make -j$(nproc)

RUN mkdir /opt/node/bin
RUN ln -s /opt/node/src/ecodollard /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]

