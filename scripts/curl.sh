#!/bin/bash
set -e

mkdir -p /tmp/curl
cd /tmp/curl

# install libcurl matching yocto
wget http://curl.haxx.se/download/curl-7.50.1.tar.bz2
tar -xvjf curl-7.50.1.tar.bz2
cd curl-7.50.1 && ./configure --disable-dict --without-gnutls --disable-gopher --disable-imap --enable-ipv6 --without-gssapi --disable-ldap --disable-ldaps --without-libidn --without-libssh2 --disable-pop3 --disable-proxy --without-librtmp --disable-rtsp --disable-smb --disable-smtp --with-ssl --with-random=/dev/urandom --disable-telnet --disable-tftp --prefix=/usr $1 && make && sudo make install && sudo ldconfig

cd /
rm -rf /tmp/curl
