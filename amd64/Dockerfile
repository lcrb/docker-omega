FROM ubuntu

RUN apt-get update && apt-get install -y git gcc gdb g++ automake default-jdk ant python make python-dev gcc-arm-none-eabi gdb-arm-none-eabi openocd sudo

RUN apt-get install -y autotools-dev automake libtool pkg-config 
RUN apt-get install -y libssl-dev libglib2.0-dev 

# Install watchman for buck
RUN git clone https://github.com/facebook/watchman.git
RUN cd watchman && ./autogen.sh && ./configure && make && make install

# Install buck
RUN git clone https://github.com/facebook/buck.git
RUN cd buck && ant 
RUN cd buck && ln -s ${PWD}/bin/buck /usr/bin/buck

# Install LFS
RUN wget https://github.com/git-lfs/git-lfs/releases/download/v2.1.0/git-lfs-linux-amd64-2.1.0.tar.gz
RUN tar -xvf git-lfs-linux-amd64-2.1.0.tar.gz && cd git-lfs-2.1.0 && ./install.sh
RUN git lfs install

# set up & update apt repositorys
RUN sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo sh -c "echo 'deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo apt-get update

# install build tools
RUN sudo apt-get install -y unzip supervisor vim tmux cmake g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf clang build-essential curl valgrind

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install amd64 deps
RUN sudo apt-get -t testing install -y libwebsockets-dev
RUN sudo apt-get install -y uuid-dev libglib2.0-dev libpulse-dev libunwind-dev libc++-dev libsqlite3-dev libavcodec-dev

# install libcurl matching yocto
RUN wget http://curl.haxx.se/download/curl-7.50.1.tar.bz2
RUN tar -xvjf curl-7.50.1.tar.bz2
RUN cd curl-7.50.1 && ./configure --disable-dict --without-gnutls --disable-gopher --disable-imap --enable-ipv6 --without-gssapi --disable-ldap --disable-ldaps --without-libidn --without-libssh2 --disable-pop3 --disable-proxy --without-librtmp --disable-rtsp --disable-smb --disable-smtp --with-ssl --with-random=/dev/urandom --disable-telnet --disable-tftp --prefix=/usr && make && sudo make install && sudo ldconfig

# install lcm
RUN wget https://github.com/lcrb/lcm/archive/v.1.3.1-c-typeinfo-make.tar.gz
RUN tar -xvf v.1.3.1-c-typeinfo-make.tar.gz
RUN cd lcm-v.1.3.1-c-typeinfo-make && ./bootstrap.sh && ./configure --prefix=/usr && make -j4 && sudo make install && sudo ldconfig
