#!/usr/bin/env bash

# symlink dot files

# Ask for the administrator password upfront.
sudo -v

for file in $(pwd)/dotfiles/.{tmux.conf,exports,aliases,functions,zshenv,zshrc,cheat,gitconfig,bin,curlrc,wgetrc}; do
    ln -sf "$file" ~;
done;
unset file;

################################################################################
# neovim
################################################################################
# mkdir $HOME/.config/nvim if it doesn't exists
neovimConfigDir="$HOME/.config/nvim"
! [ -e "$neovimConfigDir" ] && mkdir -p "$neovimConfigDir"

# link vimrc/init.vim  Ultisnips 
ln -sf $(pwd)/dotfiles/init.vim "$neovimConfigDir"
ln -sf $(pwd)/dotfiles/Ultisnips "$neovimConfigDir"
ln -sf $(pwd)/dotfiles/neosnips "$neovimConfigDir"

################################################################################
# normal vim
################################################################################
normalVimConfigDir="$HOME/.vim"
! [ -e "$normalVimConfigDir" ] && mkdir -p "$normalVimConfigDir"
ln -sf $(pwd)/dotfiles/init.vim ~/.vimrc
ln -sf $(pwd)/dotfiles/Ultisnips "$normalVimConfigDir"
ln -sf $(pwd)/dotfiles/neosnips "$normalVimConfigDir"

