#!/usr/bin/env bash

mount /dev/sda9 /backup
cp /backup/netctl/* /etc/netctl/
