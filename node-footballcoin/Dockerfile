FROM magnumwallet/base-debian

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN wget https://www.multichain.com/download/multichain-2.0.3.tar.gz && tar -xvzf multichain-2.0.3.tar.gz
RUN mv multichain-2.0.3 node

WORKDIR /opt/node

RUN mkdir /opt/node/bin
RUN ln -s /opt/node/multichaind /opt/node/bin/node
RUN ln -s /opt/node/multichain-cli /opt/node/bin/cli
RUN ln -s /opt/node/multichain-util /opt/node/bin/util

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
