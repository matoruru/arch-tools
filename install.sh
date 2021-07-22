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

# install AUR packages
(
  cd ~/repositories/
  git clone https://aur.archlinux.org/yay.git
  cd yay

  # https://github.com/Jguer/yay/issues/816
  export MAKEFLAGS="-j8"

  makepkg -si --noconfirm

  yay -Syyuq --noconfirm \
    picom \
    xorg-xinit \
    rofi \
    xorg-server \
    xf86-video-intel \
    xorg-apps \
    feh \
    kitty \
    alacritty \
    fcitx-im \
    fcitx-configtool \
    fcitx-mozc \
    nautilus \
    alsa-utils \
    libinput \
    xf86-input-libinput \
    chromium \
    scrot \
    jdk-openjdk \
    adapta-gtk-theme \
    pacman-contrib \
    peek \
    gnome-keyring \
    wmname \
    imagemagick \
    arandr \
    xclip \
    libmtp \
    gvfs-mtp \
    asunder \
    docker \
    docker-compose \
    inkscape \
    peco
)

# Parallel instalation
(
  # Install packages that takes long time
  (
    yay -Syyuq --noconfirm \
      ttf-cascadia-code \
      ttf-fantasque-sans-mono \
      nerd-fonts-iosevka \
      noto-fonts-emoji \
      ttf-symbola \
      noto-fonts-cjk \
      breeze-default-cursor-theme \
      papirus-icon-theme \
      polybar
  ) &

  (
    # install ghcup and haskell-language-server
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=true sh
    ~/.ghcup/bin/ghcup install hls

    # install stack
    curl -sSL https://get.haskellstack.org/ | sh

    # build xmonad
    bash ~/.xmonad/build
  ) &

  wait
)

# enable docker daemon
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

# download wallpaper
mkdir ~/Pictures
curl -o ~/Pictures/.xmonad-wallpaper https://www.gentoo.org/assets/img/wallpaper/gentoo-10/purple/1920x1080.jpg

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

# update origin
bash update-origin.sh
