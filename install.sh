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
    neovim \
    picom \
    xorg-xinit \
    rofi \
    xorg-server \
    xf86-video-intel \
    xorg-apps \
    neofetch \
    tree \
    feh \
    htop \
    starship-bin \
    fish \
    kitty \
    alacritty \
    time \
    fcitx-im \
    fcitx-configtool \
    fcitx-mozc \
    papirus-icon-theme \
    nautilus \
    alsa-utils \
    ttf-cascadia-code \
    ttf-fantasque-sans-mono \
    nerd-fonts-iosevka \
    noto-fonts-emoji \
    ttf-symbola \
    noto-fonts-cjk \
    lua \
    ruby \
    libinput \
    xf86-input-libinput \
    chromium \
    scrot \
    jdk-openjdk \
    adapta-gtk-theme \
    pacman-contrib \
    peek \
    gnome-keyring \
    lsof \
    expect \
    wmname \
    imagemagick \
    arandr \
    xclip \
    man-db \
    man-pages \
    whois \
    httpie \
    zip \
    unzip \
    libmtp \
    gvfs-mtp \
    asunder \
    docker \
    inkscape \
    yarn \
    breeze-default-cursor-theme \
    polybar
)

# install ghcup and haskell-language-server
(
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | BOOTSTRAP_HASKELL_NONINTERACTIVE=true sh
  ~/.ghcup/bin/ghcup install hls
)

# install stack
(
  curl -sSL https://get.haskellstack.org/ | sh
)

# see:
# - https://aur.archlinux.org/packages/ncurses5-compat-libs/
# - https://github.com/purescript/documentation/issues/119
[[ -f /usr/lib/libtinfo.so.6 ]] && sudo ln -s /usr/lib/libtinfo.so.{6,5}

# enable docker daemon
sudo usermod -aG docker $(whoami)
sudo systemctl enable docker

# download wallpaper
mkdir ~/Pictures
curl -o ~/Pictures/.xmonad-wallpaper https://www.gentoo.org/assets/img/wallpaper/gentoo-10/purple/1920x1080.jpg

# install fish theme (yimmy)
bash fish-theme.sh

# npm
export PATH=~/.npm-global/bin:$PATH

# yarn
export PATH=~/.yarn-global/bin:$PATH
yarn config set prefix ~/.yarn-global

# nodebrew
export PATH=~/.nodebrew/current/bin:$PATH
bash nodebrew.sh

# Install purescript
yarn global add \
  purescript \
  spago \
  purescript-language-server \
  pulp \
  bower

# install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Vim plugins
nvim -c :PlugInstall\|q\|q

# Install coc extensions
nvim -c :CocInstall\ -sync\
\ coc-tsserver\
\ coc-json\
\ coc-sh\
\ coc-vimlsp\
\|q\|q

# Install lang servers for Coc extensions
yarn global add \
  bash-language-server \
  vim-language-server \
  vscode-json-languageservice

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
