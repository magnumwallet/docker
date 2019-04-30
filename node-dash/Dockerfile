FROM magnumwallet/base-full

# ----

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN wget https://github.com/dashpay/dash/releases/download/v0.14.0.0-rc4/dashcore-0.14.0.0-rc4-x86_64-linux-gnu.tar.gz
RUN tar -axf dashcore-0.14.0.0-rc4-x86_64-linux-gnu.tar.gz
RUN mv dashcore-0.14.0 node

WORKDIR /opt/node
RUN ln -s /opt/node/bin/dashd /opt/node/bin/node

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
