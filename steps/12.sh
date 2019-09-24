#!/usr/bin/env bash

USERNAME=$1

useradd -mG wheel,audio,video,input $USERNAME

echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
