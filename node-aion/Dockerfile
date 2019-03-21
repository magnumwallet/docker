FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ARG DEV_BUILD=false
RUN if [ "${DEV_BUILD}" = "true" ]; then wget -O jdk.tar.gz https://download.java.net/java/GA/jdk10/10.0.1/fb4372174a714e6b8c52526dc134031e/10/openjdk-10.0.1_linux-x64_bin.tar.gz; fi
RUN if [ "${DEV_BUILD}" = "true" ]; then tar -xf jdk.tar.gz; fi
RUN if [ "${DEV_BUILD}" = "true" ]; then rm -f jdk.tar.gz; fi

RUN wget https://github.com/aionnetwork/aion/releases/download/v0.3.2/aion-v0.3.2.a0b68b7-2018-11-29.tar.bz2
RUN tar -axf aion-v0.3.2.a0b68b7-2018-11-29.tar.bz2
RUN cd /opt/aion/

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

#RUN ln -s /opt/data/config /opt/aion/mainnet/config
#RUN ln -s /opt/data/database /opt/aion/mainnet/database

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]