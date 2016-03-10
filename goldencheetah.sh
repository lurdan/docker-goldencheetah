#!/bin/sh



_run() {
  [ -f /dev/snd ] && SOUND="--device /dev/snd"
  [ -f /dev/ttyUSB0 ] && USB="--device /dev/ttyUSB0"
  [ -d $HOME/.goldencheetah ] && CONFDIR="-v $HOME/.goldencheetah:$HOME/.goldencheetah"

  docker run -it \
       --user=$USER \
       --env="DISPLAY=unix$DISPLAY" \
       --volume="/home/$USER:/home/$USER" \
       $COONFDIR \
       --volume="/etc/group:/etc/group:ro" \
       --volume="/etc/passwd:/etc/passwd:ro" \
       --volume="/etc/shadow:/etc/shadow:ro" \
       --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
       --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
       --volume="/dev/shm:/dev/shm" \
       --name goldencheetah \
       $SOUND \
       $USB \
       lurdan/goldencheetah:latest
}

_build() {
  [ "x`docker images -q lurdan/goldencheetah:head`" == "x" ] && git checkout source-build && docker build -t lurdan/goldencheetah:head .
  docker run -it \
      --volume="$(pwd)/data:/data" \
      lurdan/goldencheetah:head
}

_$1
