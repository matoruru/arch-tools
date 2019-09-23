#!/usr/bin/env bash

PARTSIZE=$1

sgdisk -d 1                                              /dev/sda
sgdisk -d 2                                              /dev/sda
sgdisk -n 1::+128M     -c 1:"EFI System"       -t 1:EF00 /dev/sda
sgdisk -n 2::$PARTSIZE -c 2:"Linux filesystem" -t 2:8300 /dev/sda
