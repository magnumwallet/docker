FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/zcash/zcash.git
# sapling viewing key: https://github.com/zcash/zcash/pull/3822/files
RUN mv zcash node

WORKDIR /opt/node
RUN ./zcutil/fetch-params.sh
RUN ./zcutil/build.sh -j$(nproc)

RUN ln -s /opt/node/src/zcashd /opt/node/src/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
