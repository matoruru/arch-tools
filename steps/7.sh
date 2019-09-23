#!/usr/bin/env bash

genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
