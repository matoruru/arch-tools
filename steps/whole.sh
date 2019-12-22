#!/usr/bin/env bash

PARTSIZE=$1
HOSTNAME=$2
INTERFACE=$3
ROOTPASSWORD=$4
USERNAME=$5
USERPASSWORD=$6
ROOTSCRIPT=$7
USERSCRIPT=$8

# check if 8 args exists
[ -z "$6" ] && {
  echo "You need to input 8 arguments!";
  echo "
  EXAMPLE 1:
   $ bash <(curl -s https://raw.githubusercontent.com/matoruru/arch-tools/master/steps/whole.sh) +60G hostname wlp2s0 rootpasswd myusername myuserpasswd \"\$(curl -s https://.../...sh)\" \"\$(curl -s https://.../...sh)\"

  EXAMPLE 2:
   $ bash <(curl -s https://raw.githubusercontent.com/matoruru/arch-tools/master/steps/whole.sh) +60G hostname wlp2s0 rootpasswd myusername myuserpasswd \"echo \\\"I am root.\\\";\" \"echo \\\"I am\\\"; echo \\\"the new user.\\\";\"

  EXAMPLE 3:
   $ bash <(curl -s https://raw.githubusercontent.com/matoruru/arch-tools/master/steps/whole.sh) +60G hostname wlp2s0 rootpasswd myusername myuserpasswd \"\$(cat file.sh)\" \"\"

  EXAMPLE 2:
   $ bash <(curl -s https://raw.githubusercontent.com/matoruru/arch-tools/master/steps/whole.sh) +60G hostname wlp2s0 rootpasswd myusername myuserpasswd \"\" \"\"
  "
  exit;
}

# check a connection to internet
ping www.google.com -i 0.2 -c 5 || { echo "Connection is not established..."; exit; }

BASEURL="https://raw.githubusercontent.com/matoruru/arch-tools/master/steps"

bash <(curl -s $BASEURL/phase1.sh) $PARTSIZE
arch-chroot /mnt bash -c "bash <(curl -s $BASEURL/phase2.sh) $HOSTNAME $INTERFACE $ROOTPASSWORD $USERNAME $USERPASSWORD"

# Execute a script($ROOTSCRIPT) as root after base install, start at ~/
arch-chroot /mnt bash -c "cd; $ROOTSCRIPT"

# Execute a script($USERSCRIPT) as a user after base install, start at ~/
arch-chroot /mnt bash -c "sudo -u $USERNAME bash -c \"cd; $USERSCRIPT\""

arch-chroot /mnt bash -c "sed -ie 's/#\ %wheel\ ALL=(ALL)\ NOPASSWD:\ ALL/%wheel\ ALL=(ALL)\ NOPASSWD:\ ALL/' /etc/sudoers"

# Execute a script as a user
arch-chroot /mnt bash -c "sudo -u $USERNAME bash -c \"bash <(curl -s $BASEURL/phase3.sh)\""

reboot
