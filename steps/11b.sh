#!/usr/bin/env bash

mkdir /backup
mount /dev/sda9 /backup
cp /backup/netctl/* /etc/netctl/
