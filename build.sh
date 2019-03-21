#!/bin/bash

docker build -t magnumwallet/base ./base/
docker build -t magnumwallet/base-full ./base-full/

docker build -t magnumwallet/node-aion ./node-aion/
docker build -t magnumwallet/node-anon ./node-anon/
docker build -t magnumwallet/node-komodo ./node-komodo/
docker build -t magnumwallet/node-litecoin ./node-litecoin/
docker build -t magnumwallet/node-tezos ./node-tezos/
#...