#!/usr/bin/env bash

# symlink dot files

# Ask for the administrator password upfront.
sudo -v

for file in $(pwd)/dotfiles/.{tmux.conf,exports,aliases,functions,zshenv,zshrc,ctags,cheat,gitconfig,bin,curlrc,wgetrc,i3}; do
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
ln -sf $(pwd)/dotfiles/UltiSnips "$neovimConfigDir"
ln -sf $(pwd)/dotfiles/neosnips "$neovimConfigDir"
# after plugin
! [ -e "$neovimConfigDir/after/plugin" ] && mkdir -p "$neovimConfigDir/after/plugin"
ln -sf  $(pwd)/dotfiles/after/plugin/my.vim "$neovimConfigDir/after/plugin"

################################################################################
# normal vim
################################################################################
normalVimConfigDir="$HOME/.vim"
! [ -e "$normalVimConfigDir" ] && mkdir -p "$normalVimConfigDir"
ln -sf $(pwd)/dotfiles/init.vim ~/.vimrc
ln -sf $(pwd)/dotfiles/UltiSnips "$normalVimConfigDir"
ln -sf $(pwd)/dotfiles/neosnips "$normalVimConfigDir"
# after plugin
! [ -e "$normalVimConfigDir/after/plugin" ] && mkdir -p "$normalVimConfigDir/after/plugin"
ln -sf  $(pwd)/dotfiles/after/plugin/my.vim "$normalVimConfigDir/after/plugin"

################################################################################
# i3
################################################################################
# soft link .i3 both in ~/.i3 directory and ~/.config/.i3
ln -sf $(pwd)/dotfiles/.i3 "$HOME/.config/"
