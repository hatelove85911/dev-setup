#!/usr/bin/env bash

echo "*******************************************************************"
echo "webdev.sh"
echo "*******************************************************************"
# Install packages for web development

# Ask for the administrator password upfront.
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
            grunt-cli)

for module in "${npmGlobalModules[@]}"
do
   sudo npm install -g "$module"
done


#gem install jekyll
