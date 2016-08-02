#!/usr/bin/env bash
echo "*******************************************************************"
echo "brew.sh"
echo "*******************************************************************"
# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo "*******************************************************************"
echo "install homebrew if not installed yet, tap respositories"
echo "update brew's formulae, upgrade already installed formulae"
echo "*******************************************************************"
# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# brew tap repositories
# brew tap bramstein/webfonttools

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all


echo "*******************************************************************"
echo "brew install formulae"
echo "*******************************************************************"
# Core casks
brewCasks=(nvalt \
           vagrant \
           vagrant-manager \
           virtualbox \
           google-chrome \
           iterm2 \
           sublime-text \
           karabiner \
           spectacle \
           skitch \
           skype \
           launchcontrol \
           dropbox \
           recordit \
           alfred \
           java \
           xquartz \
           firefox \
           slack \
           evernote \
           macdown \
           atom)
for cask in "${brewCasks[@]}"
do
   brew cask install --appdir="/Applications" "$cask"
done


# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brewQlCasks=(qlcolorcode \
            qlstephen \
            qlmarkdown \
            quicklook-json \
            qlprettypatch \
            quicklook-csv \
            betterzipql \
            qlimagesize \
            webpquicklook \
            suspicious-package)
for cask in "${brewQlCasks[@]}"
do
   brew cask install "$cask"
done
qlmanage -r

# brew install common package and brew packages
source ./commonPackages
brewPackages=(the_silver_searcher \
             docker \
             docker-machine \
             docker-compose \
             heroku-toolbelt)

for p in "${commonPackages[@]}"
do
   brew install "$p"
done
for p in "${brewPackages[@]}"
do
   brew install "$p"
done
# install stable neovim
brew install neovim/neovim/neovim

# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# link sha256sum
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# heroku update
heroku update

# Install more recent versions of some OS X tools.
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/php/php55 --with-gmp

# oh my zsh
[ -e ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install tmux plugin manager
[ -e ~/.tmux ] && rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install antigen
# [ -e ~/.zsh-antigen ] && rm -rf ~/.zsh-antigen
# git clone https://github.com/zsh-users/antigen.git ~/.zsh-antigen

# Install ruby-build and rbenv
# brew install ruby-build
# brew install rbenv
# LINE='eval "$(rbenv init -)"'
# grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install font tools.
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install homebrew/x11/xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
# brew install dark-mode
# brew install git
# brew install git-lfs
# brew install git-flow
# brew install git-extras
# brew install hub
# brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rename
# brew install rhino
# brew install speedtest_cli
# brew install ssh-copy-id
# brew install webkit2png
# brew install zopfli
# brew install pkg-config libffi
# brew install pandoc

# Lxml and Libxslt
# brew install libxml2
# brew install libxslt
# brew link libxml2 --force
# brew link libxslt --force

# Remove outdated versions from the cellar.
brew cleanup

echo "*******************************************************************"
echo "Adding the newly installed shell to the list of allowed shells"
echo "And change default shell to zsh"
echo "*******************************************************************"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh



# vim - plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
