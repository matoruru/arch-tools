#!/usr/bin/env bash

USERNAME=$1
if [ -z "$1" ]; then
  echo "Error: USERNAME is must be set!"
  exit
fi

PASSWORD=$([ -z "$2" ] && echo "password" || echo "$2")

useradd -mG wheel,audio,video,input $USERNAME
echo "$USERNAME:$PASSWORD" | chpasswd
