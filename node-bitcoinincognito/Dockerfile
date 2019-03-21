FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-program-options-dev libboost-test-dev libboost-thread-dev libboost-dev libevent-1.4-2 libdb4.8-dev libdb4.8++-dev autoconf libboost-all-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev libminiupnpc-dev git

RUN git clone https://github.com/XBIncognito/xbi-4.3.21
RUN mv /opt/xbi-4.3.21 /opt/src

WORKDIR /opt/src
RUN chmod +x autogen.sh && chmod +x share/genbuild.sh
RUN ./autogen.sh
RUN ./configure --enable-cxx --disable-shared --with-pic --prefix=$PWD/ --enable-hardening --with-gui=no
RUN make
RUN make install DESTDIR=/

WORKDIR /opt/

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
