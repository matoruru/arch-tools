#!/usr/bin/env bash

HOSTNAME=$1

echo $HOSTNAME > /etc/hostname

echo "127.0.0.1 localhost" >  /etc/hosts
echo "::1       localhost" >> /etc/hosts
