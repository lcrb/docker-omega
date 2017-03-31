FROM locorobo/docker-buck:buck-cross

# set up & update apt repositorys
RUN sudo sh -c "echo 'deb http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo sh -c "echo 'deb-src http://ftp.us.debian.org/debian/ stretch main contrib non-free' >> /etc/apt/sources.list"
RUN sudo apt-get update

# install build tools
RUN sudo apt-get install -y unzip supervisor vim tmux cmake g++-arm-linux-gnueabihf gcc-arm-linux-gnueabihf clang build-essential curl valgrind

RUN curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
RUN sudo apt-get install -y nodejs

# install armhf deps
RUN sudo apt-get -t testing install -y libwebsockets-dev
RUN sudo apt-get install -y uuid-dev libcurl4-openssl-dev libglib2.0-dev libpulse-dev libunwind-dev libc++-dev libsqlite3-dev

# install lcm
RUN wget https://github.com/lcrb/lcm/archive/v.1.3.1-c-typeinfo-make.tar.gz
RUN tar -xvf v.1.3.1-c-typeinfo-make.tar.gz
RUN cd lcm-v.1.3.1-c-typeinfo-make && ./bootstrap.sh && ./configure --prefix=/usr && make -j4 && sudo make install && sudo ldconfig
