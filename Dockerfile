# Run Goldencheetah in docker

FROM debian:sid
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

WORKDIR "$HOME"
ENV DEBIAN_FRONTEND noninteractive
RUN echo "deb http://cdn.debian.net/debian sid main" | tee /etc/apt/sources.list \
 && apt update && apt -y full-upgrade && apt install -y goldencheetah && apt-get clean

ENTRYPOINT [ "GoldenCheetah" ]

