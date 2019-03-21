FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/LIMXTEC/Megacoin.git
RUN mv Megacoin node

WORKDIR /opt/node
RUN ./autogen.sh
RUN ./configure  --without-gui
RUN make -j$(nproc)

RUN ln -s /opt/node/src/megacoind /opt/node/src/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
