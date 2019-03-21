FROM magnumwallet/base-full

VOLUME ["/mnt/data/"]
SHELL ["/bin/bash", "-c"]

# ----

WORKDIR /opt
RUN git clone https://github.com/anonymousbitcoin/anon.git

WORKDIR /opt/anon
RUN ./anonutil/build.sh -j$(nproc)
RUN ./anonutil/fetch-params.sh

WORKDIR /opt
RUN npm install https://github.com/anonymousbitcoin/bitcore-node-anon.git
RUN ./node_modules/bitcore-node-anon/bin/bitcore-node create anon-explorer

WORKDIR /opt/anon-explorer
RUN ../node_modules/bitcore-node-anon/bin/bitcore-node install https://github.com/anonymousbitcoin/insight-api-anon.git https://github.com/anonymousbitcoin/insight-ui-anon.git

#RUN sed -i 's/options.whitelistLimit || 3 \* 60 \* 60 \* 10/options.whitelistLimit || 2147483647/g' /opt/anon-explorer/node_modules/insight-api-anon/lib/ratelimiter.js
#RUN sed -i 's/options.limit || 3 \* 60 \* 60/options.limit || 2147483647/g' /opt/anon-explorer/node_modules/insight-api-anon/lib/ratelimiter.js

# ----

COPY ./data /opt/data/
WORKDIR /opt/data

# ----

COPY entrypoint.sh /usr/local/bin/
COPY cmd.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["cmd.sh", ""]