FROM ubuntu:18.04
RUN apt-get update
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install git htop vim ntp unzip libzmq3-dev build-essential cmake libdds-dev libboost-all-dev libminiupnpc-dev autoconf pkg-config libssl-dev libevent-dev libc6-dev m4 g++-multilib libtool ncurses-dev python zlib1g-dev bsdmainutils automake libmysql++-dev cmake miniupnpc libunbound-dev graphviz doxygen libunwind8-dev libgtest-dev libreadline-dev libzmq3-dev libsodium-dev libhidapi-dev libhidapi-libusb0 libcurl4-openssl-dev -y
WORkDIR /root

RUN git clone --recursive https://github.com/Beldex-Coin/beldex.git
RUN git clone --recursive https://github.com/Beldex-Coin/beldex-web-wallet.git

RUN apt-get install -y libcurl4-openssl-dev libpcsclite-dev gcc-8 g++-8 wget mc nano

WORKDIR /root/beldex
RUN rm CMakeLists.txt && wget https://gist.githubusercontent.com/sanada08/506b4d94e963dd45ea34e3f268baa772/raw/a7b714271abfd9c572bcaf452a404a0be05e362b/CMakeLists.txt -O ./CMakeLists.txt && echo 1
RUN export CC=/usr/bin/gcc-8 && export CXX=/usr/bin/g++-8 && cmake
RUN export CC=/usr/bin/gcc-8 && export CXX=/usr/bin/g++-8 && USE_SINGLE_BUILDDIR=1 make -j4

WORKDIR /root/beldex-web-wallet
RUN mkdir ./build
WORKDIR ./build
RUN export CC=/usr/bin/gcc-8 && export CXX=/usr/bin/g++-8 && cmake -DMONERO_DIR=/root/beldex ..
RUN make -j4