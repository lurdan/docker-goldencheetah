#!/bin/sh

docker run -it \
       --user=$USER \
       --env="DISPLAY" \
       --env="DISPLAY=unix$DISPLAY" \
       --volume="/home/$USER:/home/$USER" \
       --volume=$HOME/.goldencheetah/:$HOME/.goldencheetah \
       --volume="/etc/group:/etc/group:ro" \
       --volume="/etc/passwd:/etc/passwd:ro" \
       --volume="/etc/shadow:/etc/shadow:ro" \
       --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
       --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
       --volume="/dev/shm:/dev/shm" \
       --name goldencheetah \
       --device /dev/snd \
       --device /dev/ttyUSB0 \
       lurdan/goldencheetah

