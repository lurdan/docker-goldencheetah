# Build & Run Goldencheetah in docker

FROM lurdan/goldencheetah:latest
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

WORKDIR /data
ADD build.sh /usr/local/bin/build.sh

ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://ftp.debian.org/debian sid main\ndeb-src http://ftp.debian.org/debian sid main" | tee /etc/apt/sources.list \
 && apt update && apt -y full-upgrade \
 && apt -y install git \
 && apt-get build-dep -y goldencheetah \
 && chmod +x /usr/local/bin/build.sh

ENTRYPOINT ["/usr/local/bin/build.sh"]

