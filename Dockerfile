# Run Goldencheetah in docker

FROM debian:sid
MAINTAINER KURASHIKI Satoru <lurdan@gmail.com>

WORKDIR "$HOME"
VOLUME /etc/group:/etc/group:ro /etc/passwd:/etc/passwd:ro /etc/shadow:/etc/shadow:ro /etc/sudoers.d:/etc/sudoers.d:ro /tmp/.X11-unix:/tmp/.X11-unix:rw /dev/shm:/dev/shm

RUN apt update && apt install -y goldencheetah && apt-get clean

ENTRYPOINT [ "Goldencheetah" ]

