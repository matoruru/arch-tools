#!/usr/bin/env bash

sudo mount /dev/sda9 /backup

rm -rf ~/.ssh ~/.config/chromium

cp -r /backup/chromium ~/.config/
cp -r /backup/.ssh ~/
sudo cp /backup/netctl/* /etc/netctl/

sudo umount /backup
