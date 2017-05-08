#!/bin/bash
set -e

# install lcm
mkdir -p /tmp/lcm
cd /tmp/lcm

wget https://github.com/lcrb/lcm/archive/v.1.3.1-c-typeinfo-make.tar.gz
tar -xvf v.1.3.1-c-typeinfo-make.tar.gz
cd lcm-v.1.3.1-c-typeinfo-make && ./bootstrap.sh && ./configure --prefix=/usr $1 && make -j4 && sudo make install && sudo ldconfig

cd /
rm -rf /tmp/lcm
