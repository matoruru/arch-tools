#!/usr/bin/env bash

sudo mount /dev/sda9 /backup

rm -rf ~/.ssh
cp -r /backup/.ssh ./

cp /backup/.gitconfig ./
