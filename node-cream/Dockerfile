FROM magnumwallet/base-full

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

ARG repo=litecoincash-project/litecoincash
ARG platform=x86_64

# ----

WORKDIR /opt
RUN wget https://github.com/creamcoin/cream/raw/master/releases/crm-bins-ubuntu18.04.zip
RUN unzip crm-bins-ubuntu18.04.zip node

WORKDIR /opt/node
RUN ln -s `find /opt/node/bin -name "*d" | head -1` /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
