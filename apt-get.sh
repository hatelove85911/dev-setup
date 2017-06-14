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
#fasd
sudo add-apt-repository ppa:aacebedo/fasd
#ssqt5
sudo add-apt-repository ppa:hzwhuang/ss-qt5
#docker engine
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
# i3 packages
# add getdeb ppa for polybar
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

# wine for windows applications
sudo add-apt-repository ppa:ubuntu-wine/ppa


# update all package info to latest
sudo apt-get update -y
# upgrade all existing package to latest
sudo apt-get dist-upgrade -y

echo "*******************************************************************"
echo "install apt packages"
echo "*******************************************************************"
sudo apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-common vim-gui-common

source ./commonPackages

aptPackages=(chromium-browser \
            vim-gtk \
            vim-runtime \
            gnome-terminal \
            rxvt-unicode-256color \
            nvpy \
            dconf-cli \
            shadowsocks-qt5 \
            silversearcher-ag \
            sed \
            python-pip \
            python-dev \
            python3-pip \
            python3-dev \
            luajit5.1-dev \
            libluajit-5.1-dev \
            docker-engine \
            shutter \
            feh \
            w3m \
            virtualbox \
            fcitx \
            fcitx-googlepinyin \
            exuberant-ctags \
            jq \
# ncurse interface applications
            tig \
            ranger \
            htop \
            ncmpcpp \
            sc \
            mutt \
# i3 dependent package
            i3 \
            compton \
            xdotool \
            polybar \
# openbox
            openbox \
            obconf \
# clipboard
            xclip \
            xsel \
# wifi
            wicd-curses \
            wicd \
# wine 
            wine1.8)

# remove the old tidy program first, otherwise there's going to error generated when install the new tidy html5
sudo apt-get remove -y libtidy-0.99-0 tidy
# download tidy binaries, download to temp file, and install
URL='http://binaries.html-tidy.org/binaries/tidy-5.2.0/tidy-5.2.0-64bit.deb'; FILE=$(mktemp); wget "$URL" -qO $FILE && sudo dpkg -i $FILE; rm $FILE

for p in "${commonPackages[@]}"
do
   sudo apt-get install -y "$p"
done

for p in "${aptPackages[@]}"
do
   sudo apt-get install -y "$p"
done

####################################################################################################
# install xcape
####################################################################################################
#xcape dependencies
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev

git clone https://github.com/alols/xcape.git ~/Downloads/xcape
cd ~/Downloads/xcape
make
sudo make install

####################################################################################################
# fzf
####################################################################################################
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

####################################################################################################
# oh my zsh
####################################################################################################
# install oh my zsh
[ -e ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install agnosterzak zsh theme
wget https://raw.githubusercontent.com/zakaziko99/agnosterzak-ohmyzsh-theme/master/agnosterzak.zsh-theme -O ~/.oh-my-zsh/themes/agnosterzak.zsh-theme

# install powerlevel9k theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

####################################################################################################
# solarized
####################################################################################################
# download gnome solarized theme, set gnome terminal preferences manually
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git ~/Downloads/gnome-terminal-colors-solarized
cd ~/Downloads/gnome-terminal-colors-solarized
./install.sh

# install solarized dir colors
git clone https://github.com/seebi/dircolors-solarized ~/dircolors-solarized
cp ~/dircolors-solarized/dircolors.256dark ~/.dir_colors
rm -rf ~/dircolors-solarized

####################################################################################################
# tmux plugin managerj
####################################################################################################
# install tmux plugin manager
[ -e ~/.tmux ] && rm -rf ~/.tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


####################################################################################################
# powerline fonts
####################################################################################################
# install powerline fonts
[ -e ~/Downloads/powerlinefonts ] && rm -rf ~/Downloads/powerlinefonts
git clone https://github.com/powerline/fonts.git ~/Downloads/powerlinefonts
bash ~/Downloads/powerlinefonts/install.sh

echo "*******************************************************************"
echo "Adding the newly installed shell to the list of allowed shells"
echo "And change default shell to zsh"
echo "*******************************************************************"
sudo bash -c 'echo /usr/bin/bash >> /etc/shells'
sudo bash -c 'echo /usr/bin/zsh >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/bin/zsh
