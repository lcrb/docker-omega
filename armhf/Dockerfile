FROM locorobo/docker-buck:buck-cross

# set up & update apt repositorys
RUN sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo sh -c "echo 'deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo apt-get update

# install build tools
RUN sudo apt-get install -y unzip supervisor vim tmux cmake g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf clang build-essential curl

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install armhf deps
RUN sudo apt-get -t testing install -y libwebsockets-dev:armhf
RUN sudo apt-get install -y uuid-dev:armhf libglib2.0-dev:armhf libpulse-dev:armhf libunwind-dev:armhf libc++-dev:armhf libsqlite3-dev:armhf libavcodec-dev:armhf

# install libcurl matching yocto
RUN wget http://curl.haxx.se/download/curl-7.50.1.tar.bz2
RUN tar -xvjf curl-7.50.1.tar.bz2
RUN cd curl-7.50.1 && ./configure --disable-dict --without-gnutls --disable-gopher --disable-imap --enable-ipv6 --without-gssapi --disable-ldap --disable-ldaps --without-libidn --without-libssh2 --disable-pop3 --disable-proxy --without-librtmp --disable-rtsp --disable-smb --disable-smtp --with-ssl --with-random=/dev/urandom --disable-telnet --disable-tftp --host=arm-linux-gnueabihf --prefix=/usr && make && sudo make install && sudo ldconfig

# install lcm
RUN wget https://github.com/lcrb/lcm/archive/v.1.3.1-c-typeinfo-make.tar.gz
RUN tar -xvf v.1.3.1-c-typeinfo-make.tar.gz
RUN cd lcm-v.1.3.1-c-typeinfo-make && ./bootstrap.sh && ./configure --host=arm-linux-gnueabihf --prefix=/usr && make -j4 && sudo make install && sudo ldconfig
