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

# Nodejs for Insight
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get install -y nodejs

#FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/anonymousbitcoin/anon.git

WORKDIR /opt/anon
RUN ./anonutil/build.sh -j$(nproc)
RUN ./anonutil/fetch-params.sh

WORKDIR /opt
RUN npm install https://github.com/anonymousbitcoin/bitcore-node-anon.git
RUN ./node_modules/bitcore-node-anon/bin/bitcore-node create anon-explorer

WORKDIR /opt/anon-explorer
RUN ../node_modules/bitcore-node-anon/bin/bitcore-node install https://github.com/anonymousbitcoin/insight-api-anon.git https://github.com/anonymousbitcoin/insight-ui-anon.git

#RUN sed -i 's/options.whitelistLimit || 3 \* 60 \* 60 \* 10/options.whitelistLimit || 2147483647/g' /opt/anon-explorer/node_modules/insight-api-anon/lib/ratelimiter.js
#RUN sed -i 's/options.limit || 3 \* 60 \* 60/options.limit || 2147483647/g' /opt/anon-explorer/node_modules/insight-api-anon/lib/ratelimiter.js

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]