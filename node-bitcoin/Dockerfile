FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/bitcoin/bitcoin.git
RUN mv bitcoin node

WORKDIR /opt/node
RUN ls -la
RUN ls -la

RUN ./autogen.sh
RUN ./configure  --without-gui
RUN make -j$(nproc)
RUN make install

RUN ln -s /opt/node/src/bitcoind /opt/node/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]