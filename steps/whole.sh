#!/usr/bin/env bash

PARTSIZE=$1
HOSTNAME=$2
INTERFACE=$3
ROOTPASSWORD=$4
USERNAME=$5
USERPASSWORD=$6

# check if 6 args exists
[ -z "$6" ] && { echo "You need to input 6 arguments!"; exit; }

# check a connection to internet
ping www.google.com -i 0.2 -c 5 || { echo "Connection is not established..."; exit; }

bash phase1.sh $PARTSIZE
arch-chroot /mnt bash -c "bash phase2.sh $HOSTNAME $INTERFACE $ROOTPASSWORD $USERNAME $USERPASSWORD"

reboot
