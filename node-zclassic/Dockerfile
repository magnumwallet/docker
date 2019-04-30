FROM debian
MAINTAINER Smirnov Dmitry <smdmitry@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends mc nano wget curl git sudo ca-certificates rsync libcurl4-openssl-dev rsync

RUN apt-get update && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils \
       python3 libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev \
       libzmq3-dev make m4 gcc aspcud ocaml opam libgmp-dev libhidapi-dev pkg-config rsync m4 patch unzip libev-dev \
       bzip2 lsb-release jq locales net-tools libicu-dev libedit-dev libedit2 libffi6 libtinfo5 \
       g++ cmake llvm-4.0 libjsoncpp1 libjsoncpp-dev libboost-dev libzmq5 libsqlite3-dev libgmp-dev git build-essential libtool \
        autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev software-properties-common

RUN apt-get update && apt-get install -y --no-install-recommends libdb++-dev

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/ZclassicCommunity/zclassic.git
RUN mv zclassic node

WORKDIR /opt/node
RUN ./zcutil/build.sh -j$(nproc)

RUN ln -s /opt/node/src/zclassicd /opt/node/src/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]