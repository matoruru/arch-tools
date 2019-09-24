#!/usr/bin/env bash

HOSTNAME=$1
INTERFACE=$2
ROOTPASSWORD=$3
USERNAME=$4
USERPASSWORD=$5

BASEURL="https://raw.githubusercontent.com/matoruru/arch-tools/master/steps"

bash <(curl -s $BASEURL/8.sh  )
bash <(curl -s $BASEURL/9.sh  ) $HOSTNAME
bash <(curl -s $BASEURL/10.sh )
bash <(curl -s $BASEURL/11.sh ) $INTERFACE
bash <(curl -s $BASEURL/11b.sh)

echo "root:$ROOTPASSWORD" | chpasswd

bash <(curl -s $BASEURL/12.sh ) $USERNAME $USERPASSWORD
bash <(curl -s $BASEURL/13.sh )
bash <(curl -s $BASEURL/14.sh )

sudo -u $USERNAME bash <(curl -s https://raw.githubusercontent.com/matoruru/dotfiles/master/install.sh)
