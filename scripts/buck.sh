#!/bin/bash
set -e

echo 'deb http://http.debian.net/debian jessie-backports main' > /etc/apt/sources.list.d/jessie-backports.list
apt-get update
apt-get -y install openjdk-8-jdk-headless openjdk-8-jre-headless

mkdir -p /opt/buck
cd /opt/buck

# Install watchman for buck
git clone https://github.com/facebook/watchman.git
cd watchman && ./autogen.sh && ./configure && make && make install

# Install buck
git clone https://github.com/facebook/buck.git
cd buck 
ant
ln -s ${PWD}/bin/buck /usr/bin/buck
