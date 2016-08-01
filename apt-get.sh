#!/usr/bin/env bash
echo "*******************************************************************"
echo "apt-get.sh"
echo "*******************************************************************"
# Install command-line tools using apt-get.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "*******************************************************************"
echo "adding ppa & update apt-get & upgrade all existing package to latest"
echo "*******************************************************************"
sudo add-apt-repository ppa:nginx/stable
#tmux ppa
sudo add-apt-repository ppa:pi-rho/dev
#neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
#fasd
sudo add-apt-repository ppa:aacebedo/fasd
#docker engine
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list



# update all package info to latest
sudo apt-get update -y
# upgrade all existing package to latest
sudo apt-get dist-upgrade -y

echo "*******************************************************************"
echo "install apt packages"
echo "*******************************************************************"
source ./commonPackages

aptPackages=(neovim \
            silversearcher-ag \
            sed \
            python-pip \
            python-dev \
            python3-pip \
            python3-dev \
            docker-engine)

for p in "${commonPackages[@]}"
do
   sudo apt-get install "$p"
done

for p in "${aptPackages[@]}"
do
   sudo apt-get install "$p"
done


# install heroku toolbelt
wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh
heroku update

# install antigen
git clone https://github.com/zsh-users/antigen.git ~/.zsh-antigen

echo "*******************************************************************"
echo "Adding the newly installed shell to the list of allowed shells"
echo "And change default shell to zsh"
echo "*******************************************************************"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
sudo bash -c 'echo /usr/local/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/zsh