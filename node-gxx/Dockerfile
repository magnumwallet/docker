FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

RUN mkdir /opt/gravitycoin
WORKDIR /opt/gravitycoin
RUN wget https://github.com/GravityCoinOfficial/GravityCoin/releases/download/4.0.5.0/linux-x64.tar.gz
RUN tar -axf linux-x64.tar.gz

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]
