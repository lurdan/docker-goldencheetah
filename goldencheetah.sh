#!/bin/sh

docker run -it \
       --user=$USER \
       --env="DISPLAY" \
       --env="DISPLAY=unix$DISPLAY" \
       --volume="/home/$USER:/home/$USER" \
       --volume=$HOME/.goldencheetah/:$HOME/.goldencheetah \
       --name goldencheetah \
       --device /dev/snd \
       --device /dev/usb \
       lurdan/goldencheetah

