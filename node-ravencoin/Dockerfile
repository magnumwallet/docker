FROM magnumwallet/base-debian

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/RavenProject/Ravencoin.git
RUN mv Ravencoin node

WORKDIR /opt/node
RUN ./autogen.sh
RUN ./configure --without-gui --disable-wallet
RUN make -j$(nproc)

RUN mkdir /opt/node/bin/
RUN ln -s /opt/node/src/ravend /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]

