#!/usr/bin/env bash

echo "*******************************************************************"
echo "webdev.sh"
echo "*******************************************************************"
# Install packages for web development
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "*******************************************************************"
echo "install nvm"
echo "*******************************************************************"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && source "$NVM_DIR/nvm.sh"

echo "*******************************************************************"
echo "install latest node"
echo "*******************************************************************"
nvm install node
nvm use node

echo "*******************************************************************"
echo "install npm global modules"
echo "*******************************************************************"
# install NPM Modules
npmGlobalModules=(eslint \
            standard-format \
            standard \
            node-inspector \
            devtool \
            jsonlint \
            yeoman-doctor \
            yo \
            hexo \
            grunt-cli \
            http-server \
            json-server \
            git+https://github.com/ramitos/jsctags.git \
            nproxy \
            vue-cli \
            js-beautify \
            cnpm \
            yarn)

for module in "${npmGlobalModules[@]}"
do
   npm install -g "$module"
done

echo "*******************************************************************"
echo "install python packages"
echo "*******************************************************************"
# setup virtualenv for python3
# python virtualenv means it creates a virtual env for certain python version at a path you specified
# then it will put all the things: bins, libs ... in that location
# afterwards source /path/to/virtualenv/bin/activate in your shell to activate the virtual env
# thus everything afterwards will be all put in the path of virutal env
# pip3 install virtualenv
# [ -e ~/.virtualenv ] && rm -rf ~/.virtualenv
# python3 -m virtualenv ~/.virtualenv

# install NPM Modules
pythonPackages=(cheat \
            neovim)

for p in "${pythonPackages[@]}"
do
   sudo pip3 install -g "$p"
done

#gem install jekyll
