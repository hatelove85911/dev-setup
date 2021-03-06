#!/usr/bin/env bash

# symlink dot files

# Ask for the administrator password upfront.
sudo -v

for file in $(pwd)/dotfiles/.{tmux.conf,aliases,functions,zfunctions,zshenv,zshrc,ctags,gitconfig,bin,prettierrc,curlrc,wgetrc,i3,npmrc,yarnrc,pacconfig,vimrc,vim,xsession,Xresources}
do
	    ln -sf "$file" ~
done
unset file;
####################################################################################################
# install vim plugin manager
####################################################################################################
# install vim plug, the vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

################################################################################
# i3
################################################################################
# soft link .i3 both in ~/.i3 directory and ~/.config/.i3
! [ -e "$HOME/.config/" ] && mkdir -p ""$HOME/.config/""
ln -sf $(pwd)/dotfiles/.i3 "$HOME/.config/"

################################################################################
# openbox
################################################################################
! [ -e "$HOME/.config/" ] && mkdir -p ""$HOME/.config/""
ln -sf $(pwd)/dotfiles/openbox "$HOME/.config/"
