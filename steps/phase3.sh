#!/usr/bin/env bash

mount /dev/sda9 /backup

rm -rf ~/.ssh ~/.config/chromium

cp -r /backup/chromium ~/.config/
cp -r /backup/.ssh ~/
sudo cp /backup/netctl/* /etc/netctl/

umount /backup
