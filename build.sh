#!/bin/sh

[ -f /data/GoldenCheetah ] && cp /data/GoldenCheetah /usr/bin/ && exec /usr/bin/GoldenCheetah

apt-get source goldencheetah
[ -d goldencheetah ] ||  git clone https://github.com/GoldenCheetah/GoldenCheetah.git goldencheetah
cp -pR goldencheetah-*/debian goldencheetah/debian

export DEB_BUILD_OPTIONS="parallel=`nproc`"
cd /data/goldencheetah
debian/rules build
cp src/GoldenCheetah /data/

