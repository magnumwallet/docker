FROM ubuntu:18.04
MAINTAINER Alexei <alexei@guarda.co>
RUN apt-get update
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install git htop vim ntp unzip libzmq3-dev build-essential cmake libdds-dev libboost-all-dev libminiupnpc-dev autoconf pkg-config libssl-dev libevent-dev libc6-dev m4 g++-multilib libtool ncurses-dev python zlib1g-dev bsdmainutils automake libmysql++-dev cmake miniupnpc libunbound-dev graphviz doxygen libunwind8-dev libgtest-dev libreadline-dev libzmq3-dev libsodium-dev libhidapi-dev libhidapi-libusb0 libcurl4-openssl-dev -y
WORkDIR /root

RUN git clone --recursive https://github.com/monero-project/monero.git
RUN git clone --recursive https://github.com/moneroexamples/openmonero.git

WORKDIR /root/monero
RUN USE_SINGLE_BUILDDIR=1 make -j4

RUN apt-get install libcurl4-openssl-dev

WORKDIR /root/openmonero
RUN mkdir ./build
WORKDIR ./build
RUN cmake -DMONERO_DIR=/root/monero ..
RUN make -j4