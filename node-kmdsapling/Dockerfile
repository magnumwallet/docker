FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone -b dev https://github.com/jl777/komodo

RUN sed -i 's/KOMODO_SAPLING_ACTIVATION 1544832000/KOMODO_SAPLING_ACTIVATION 1543073054/g' ./komodo/src/komodo_defs.h 
RUN sed -i 's/KOMODO_SAPLING_DEADLINE 1550188800/KOMODO_SAPLING_DEADLINE 1543593600/g' ./komodo/src/komodo_defs.h

WORKDIR /opt/komodo
RUN ./zcutil/build.sh -j$(nproc)
RUN ./zcutil/fetch-params.sh

WORKDIR /opt
RUN npm install https://github.com/DeckerSU/bitcore-node-komodo.git
RUN ./node_modules/bitcore-node-komodo/bin/bitcore-node create komodo-explorer

WORKDIR /opt/komodo-explorer
RUN ../node_modules/bitcore-node-komodo/bin/bitcore-node install https://github.com/DeckerSU/insight-api-komodo.git https://github.com/DeckerSU/insight-ui-komodo.git

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

RUN ln -s /mnt/data/ /root/.komodo

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/
COPY komodod.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
