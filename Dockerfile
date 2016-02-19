# Run Goldencheetah in docker

FROM debian:sid
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

WORKDIR "$HOME"
RUN apt update && apt install -y goldencheetah && apt-get clean

ENTRYPOINT [ "Goldencheetah" ]

