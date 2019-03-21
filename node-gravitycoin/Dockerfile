FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/GravityCoinOfficial/gravitycoin

WORKDIR /opt/gravitycoin
RUN ./autogen.sh
RUN ./configure  --without-gui
RUN make -j$(nproc)

#RUN cd src && strip GravityCoin && strip gravitycoin-cli

WORKDIR /opt/gravitycoin/

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]