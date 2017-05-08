#!/bin/bash
set -e

mkdir -p /tmp/lfs
cd /tmp/lfs

# Install LFS
wget https://github.com/git-lfs/git-lfs/releases/download/v2.1.0/git-lfs-linux-amd64-2.1.0.tar.gz
tar -xvf git-lfs-linux-amd64-2.1.0.tar.gz && cd git-lfs-2.1.0 && ./install.sh
git lfs install

cd /
rm -rf /tmp/lfs
