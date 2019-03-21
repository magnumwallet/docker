FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/bitcoinair/bitcoin-air-blockchain-v1.0.git
RUN mv bitcoin-air-blockchain-v1.0 node

WORKDIR /opt/node
RUN ./autogen.sh
RUN ./configure  --without-gui
RUN make -j$(nproc)

RUN ln -s /opt/node/src/BitcoinAird /opt/node/src/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
