FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/jl777/komodo

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

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
