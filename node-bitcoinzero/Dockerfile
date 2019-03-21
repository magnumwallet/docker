FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/BitcoinZeroOfficial/bitcoinzero

WORKDIR /opt/bitcoinzero
RUN ./autogen.sh
RUN ./configure  --without-gui
RUN make -j$(nproc)

RUN cd src && strip bitcoinzerod && strip bitcoinzero-cli

WORKDIR /opt/bitcoinzero/

#bznode genkey

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]