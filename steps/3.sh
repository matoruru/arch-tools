#!/usr/bin/env bash

mkfs.vfat -F32 /dev/sda1
mkfs.xfs  -f   /dev/sda2

mount /dev/sda2 /mnt

mkdir           /mnt/boot
mount /dev/sda1 /mnt/boot

mkdir           /mnt/backup
