#!/usr/bin/env bash

INTERFACE=$1

systemctl disable dhcpcd@$INTERFACE.service
systemctl enable netctl-auto@$INTERFACE.service
