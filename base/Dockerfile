FROM ubuntu:xenial
MAINTAINER Smirnov Dmitry <smdmitry@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends mc nano wget curl git sudo ca-certificates rsync libcurl4-openssl-dev rsync

RUN apt-get update && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils \
       python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev \
       libzmq3-dev make m4 gcc aspcud ocaml opam libgmp-dev libhidapi-dev pkg-config rsync m4 patch unzip libev-dev \
       bzip2 lsb-release jq locales net-tools libicu-dev libedit-dev libicu55 libedit2 libffi6 libtinfo5 \
       g++ cmake llvm-4.0 libjsoncpp1 libjsoncpp-dev libboost-dev libzmq5 libsqlite3-dev libgmp-dev git build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev software-properties-common

RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update && apt-get install -y libdb4.8-dev libdb4.8++-dev libminiupnpc-dev libzmq3-dev

# Nodejs for Insight
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs

# OCaml for Tezos
#RUN wget https://github.com/ocaml/opam/releases/download/2.0.0/opam-2.0.0-x86_64-linux
#RUN cp opam-2.0.0-x86_64-linux /usr/local/bin/opam
#RUN chmod a+x /usr/local/bin/opam

#RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*