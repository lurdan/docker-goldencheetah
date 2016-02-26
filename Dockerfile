# Build & Run Goldencheetah in docker

FROM lurdan/goldencheetah:latest
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://cdn.debian.net/debian sid main\ndeb-src http://cdn.debian.net/debian sid main" | tee /etc/apt/sources.list \
 && apt update && apt -y full-upgrade && apt install -y git debfoster && debfoster -q \
 && apt-get build-dep -y goldencheetah && apt-get source goldencheetah \
 && git clone https://github.com/GoldenCheetah/GoldenCheetah.git goldencheetah \
 && cp -pR goldencheetah-*/debian goldencheetah/debian

RUN export DEB_BUILD_OPTIONS="parallel=`nproc`" \
 && cd goldencheetah && debian/rules build \
 && yes | debfoster -f && apt-get clean \
 && cp src/GoldenCheetah /usr/bin/GoldenCheetah \
 && cd .. && rm -rf goldencheetah*

RUN apt install -y libical1a
