#!/bin/bash

if [[ ! $(pwd) = "$HOME/repositories/matoruru/arch-tools" ]]; then
   echo "Invalid location!"
   echo "Move to $HOME/repositories/matoruru/arch-tools and execute again..."
   exit
fi

function ping_failure {
   echo "no connection... failure"
   echo "exit"
   exit
}

ping www.github.com -c5 -i 0.2 || ping_failure

# install packages
sudo pacman -Syu
sudo pacman -S fish compton xorg-xinit rofi compton xorg-server xf86-video-intel xorg-apps neofetch tree feh time htop fish kitty time fcitx-im fcitx-configtool fcitx-mozc gimp nautilus alsa-utils ttf-fira-code libreoffice lua ruby libinput xf86-input-libinput intellij-idea-community-edition code stack chromium pinta rxvt-unicode xmonad-contrib scrot vim git openssh jdk-openjdk adapta-gtk-theme pacman-contrib peek

# install AUR packages
cd ~/repositories/
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syu
yay -S breeze-default-cursor-theme paper-icon-theme ttf-monaco aosp-devel typora polybar

# install a file for todo list
cp todolist.txt ~/

# install dic
(
   cd ~/repositories/matoruru
   git clone git@github.com:matoruru/dic.git
   cd dic;bash install.sh
)

# copy Picture to ~/ and set wallpaper
cp -r Pictures ~/
sudo cp setwp.sh /usr/local/bin/setwp
sudo chmod +x /usr/local/bin/setwp
curl -o ~/Pictures/gentoo-1920x1080.jpg https://www.gentoo.org/assets/img/wallpaper/gentoo-10/purple/1920x1080.jpg
mkdir -p ~/Pictures/wallpaper
ln -srf ~/Pictures/gentoo-1920x1080.jpg ~/Pictures/wallpaper/main.jpg

# install fish theme (yimmy)
bash fish-theme.sh

# install fonts
mkdir ~/.fonts
cp fonts/*ttf ~/.fonts/
find fonts/ -name "*.tar.bz2"|xargs -n 1 -I XXX tar vxf XXX -C ~/.fonts/
( cd ~/.fonts;fc-cache -vf )

# set environment variables for nodejs,
# install nodebrew, the Node.js version manager without sudo
# and intall tools related to purescript
export PATH=~/.npm-global/bin:$PATH
export PATH=~/.nodebrew/current/bin:$PATH
bash nodebrew.sh
npm i -g yarn bower purescript pulp

# install dein
bash dein.sh
mkdir -p ~/.vim/.tmp/undo   \
         ~/.vim/.tmp/backup \
         ~/.vim/.tmp/swp

# create executable file in path
sudo cp screenshot.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/screenshot.sh

# set symbolic links to cursor images
mkdir ~/.icons
ln -s /usr/share/icons/Breeze_Default ~/.icons/breeze-cursors

# enable tap as click
sudo ln -srf 40-libinput.conf /usr/share/X11/xorg.conf.d/
