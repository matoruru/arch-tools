#!/usr/bin/env bash

mkinitcpio -p linux
bootctl --path=/boot install

echo "default arch" >  /boot/loader/loader.conf
echo "timeout 1"    >> /boot/loader/loader.conf
echo "editor  no"   >> /boot/loader/loader.conf

DATE=$(date|awk '{print $2" "$3" "$6}')

echo "title   Arch Linux ($DATE)"   >  /boot/loader/entries/arch.conf
echo "linux   /vmlinuz-linux"       >> /boot/loader/entries/arch.conf
echo "initrd  /intel-ucode.img"     >> /boot/loader/entries/arch.conf
echo "initrd  /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options root=/dev/sda2 rw"    >> /boot/loader/entries/arch.conf
