# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
# for file in ~/.{path,exports,aliases,functions,extra}; do
#     [ -r "$file" ] && [ -f "$file" ] && source "$file";
# done;
# unset file;

##################################################
# nvm
##################################################
# [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh" # This loads nvm
# nvm use node

##################################################
# docker
##################################################
# Always start by pointing to the local dev instance on mac os
# if [[  "$OSTYPE" == "darwin"*  ]]; then
#   dmenv dev;
# fi


##################################################
# set proxy if behind corporate proxy
##################################################
# proxy address in SAP 
# export proxyaddr=http://proxy.tyo.sap.corp:8080
# ping -c 1 "$proxyaddr" > /dev/null 2>&1
# corporate=$?
# if [ "$corporate" -eq 0 ]; then
#   onProxy
# else
#   offProxy
# fi


##################################################
# source antigen
##################################################
source ~/.zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# source $ZSH/oh-my-zsh.sh
# autoload -U colors && colors
# setopt promptsubst
# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle tmux
antigen bundle vi-mode
# antigen bundle fasd

# antigen bundle djui/alias-tips
# antigen bundle tarruda/zsh-autosuggestions
# antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-history-substring-search

# theme
antigen theme robbyrussell

antigen apply

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# intialize fasd
# eval "$(fasd --init auto)"

# enable extended globbing
# setopt extended_glob

# IGNOREEOF forces the user to type exit or logout, instead of just pressing ^D.
# setopt ignoreeof



# stty ixany
# stty ixoff -ixon

# LS_COLORS=$LS_COLORS:'ow=34;40:' ; export LS_COLORS