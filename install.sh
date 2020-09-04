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

ping www.google.com -c5 -i 0.2 || ping_failure

# install packages
sudo pacman -Syyuq --noconfirm neovim compton xorg-xinit rofi xorg-server xf86-video-intel xorg-apps neofetch tree feh htop fish kitty time fcitx-im fcitx-configtool fcitx-mozc nautilus alsa-utils ttf-fira-code lua ruby libinput xf86-input-libinput code stack chromium rxvt-unicode xmonad-contrib scrot jdk-openjdk adapta-gtk-theme pacman-contrib peek gnome-keyring lsof expect wmname imagemagick arandr xclip man-db man-pages whois httpie zip unzip libmtp gvfs-mtp asunder
# install AUR packages
(
  cd ~/repositories/
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  yay -Syyuq --noconfirm breeze-default-cursor-theme paper-icon-theme ttf-monaco polybar
)

# install a file for todo list
cp todolist.txt ~/

# copy Picture to ~/ and set wallpaper
cp -r Pictures ~/
mkdir   ~/.wallpapers
curl -o ~/.wallpapers/1.jpg https://www.gentoo.org/assets/img/wallpaper/gentoo-10/purple/1920x1080.jpg

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

npm install -g yarn
export PATH=~/.yarn-global/bin:$PATH
yarn config set prefix ~/.yarn-global

# Install purescript

yarn global add spago
npm install -g purescript
npm install -g pulp bower
npm install -g purescript-language-server

# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Vim plugins
nvim -c :PlugInstall -c :q -c :q

# create executable file in path
sudo cp screenshot.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/screenshot.sh

# set symbolic links to cursor images
mkdir ~/.icons
ln -s /usr/share/icons/Breeze_Default ~/.icons/breeze-cursors

# enable tap as click
sudo ln -srf 40-libinput.conf /usr/share/X11/xorg.conf.d/

# for dbus session
sudo cp 30-dbus.sh /etc/X11/xinit/xinitrc.d/
sudo chmod 755 /etc/X11/xinit/xinitrc.d/30-dbus.sh

# for base16-shell
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
fish -c "source ~/.config/base16-shell/profile_helper.fish; base16-solarized-dark"
