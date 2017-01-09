#!/usr/bin/env bash

# symlink dot files

# Ask for the administrator password upfront.
sudo -v

for file in $(pwd)/dotfiles/.{tmux.conf,exports,aliases,functions,zshenv,zshrc,ctags,gitconfig,bin,curlrc,wgetrc,i3,npmrc,yarnrc,genpac_config.ini}; do
    ln -sf "$file" ~;
done;
unset file;

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
! [ -e "$HOME/.config/"] && mkdir -p ""$HOME/.config/""
ln -sf $(pwd)/dotfiles/.i3 "$HOME/.config/"
