#!/usr/bin/env bash

# symlink dot files

# Ask for the administrator password upfront.
sudo -v

for file in $(pwd)/dotfiles/.{tmux.conf,exports,aliases,functions,zshenv,zshrc,cheat,gitconfig,bin,curlrc,wgetrc}; do
    ln -sf "$file" ~;
done;
unset file;

# mkdir $HOME/.config/nvim if it doesn't exists
neovimConfigDir="$HOME/.config/nvim"
! [ -e "$neovimConfigDir" ] && mkdir -p "$neovimConfigDir"

# link vim init.vim Ultisnips into n
ln -sf $(pwd)/dotfiles/init.vim "$neovimConfigDir"
ln -sf $(pwd)/dotfiles/Ultisnips "$neovimConfigDir"