#!/usr/bin/env bash

PARTSIZE=$1

BASEURL="https://raw.githubusercontent.com/matoruru/arch-tools/master/steps"

bash <(curl -s $BASEURL/2.sh) $PARTSIZE
bash <(curl -s $BASEURL/3.sh)
bash <(curl -s $BASEURL/4.sh)
bash <(curl -s $BASEURL/5.sh)
bash <(curl -s $BASEURL/6.sh)
bash <(curl -s $BASEURL/7.sh)
