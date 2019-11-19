FROM magnumwallet/base-debian

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/anonymousbitcoin/anon.git
RUN mv anon node

WORKDIR /opt/node
RUN ./zcutil/fetch-params.sh
RUN ./zcutil/build.sh -j$(nproc)
RUN make -j$(nproc)

RUN mkdir /opt/node/bin/
RUN ln -s /opt/node/src/anond /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]

