FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone -b bitcore https://github.com/wo01/zcash.git

WORKDIR /opt/zcash
RUN ./zcutil/build.sh -j$(nproc)
RUN ./zcutil/fetch-params.sh

WORKDIR /opt
RUN npm install https://github.com/wo01/bitcore-node-zcash
RUN ./node_modules/bitcore-node-zcash/bin/bitcore-node create explorer

WORKDIR /opt/explorer
RUN ../node_modules/bitcore-node-zcash/bin/bitcore-node install https://github.com/wo01/insight-api-zcash.git https://github.com/wo01/insight-ui-zcash.git

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]