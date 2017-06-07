#!/usr/bin/env bash

echo "*******************************************************************"
echo "webdev.sh"
echo "*******************************************************************"
# Install packages for web development
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


echo "*******************************************************************"
echo "install latest node"
echo "*******************************************************************"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "*******************************************************************"
echo "install npm global modules"
echo "*******************************************************************"
# install NPM Modules
npmGlobalModules=(eslint \
            node-inspector \
            devtool \
            yeoman-doctor \
            yo \
            hexo \
            grunt-cli \
            http-server \
            json-server \
            git+https://github.com/ramitos/jsctags.git \

            js-beautify \
            standard-format \
            standard \
            prettier \
            xo \

            ngrok \
            yarn)

for module in "${npmGlobalModules[@]}"
do
   npm install -g --registry https://registry.npm.taobao.org "$module"
done


echo "*******************************************************************"
echo "install pip modules
echo "*******************************************************************"
pipModules=(sncli \
            genpac \
            ConfigParser)

for module in "${pipModules[@]}"
do
   pip3 install "$module"
done
