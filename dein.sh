#!/bin/bash

# Install plugin manager for vim, dein
if [[ ! -d $HOME/.vim/dein ]]; then
   mkdir -p $HOME/.vim/dein
   cd       $HOME/.vim/dein
   curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
   sh installer.sh ~/.vim/dein
fi


# Install plugin manager for nvim, dein
if [[ ! -d $HOME/.nvim/dein ]]; then
   mkdir -p $HOME/.nvim/dein
   cd       $HOME/.nvim/dein
   curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
   sh installer.sh ~/.nvim/dein
fi
