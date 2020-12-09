#!/bin/bash

set -e

blue_text(){
  echo -e "\e[34m$@\e[39m"
}

yellow_text(){
  echo -e "\e[33m$@\e[39m"
}

green_text(){
  echo -e "\e[32m$@\e[39m"
}

# -------- ESSENTIALS --------
yellow_text "-------- ESSENTIALS --------"

# -> Configure GIT
blue_text "Configuring git configs (mauriciomutte <litiobr@gmail.com)"
git config --global user.email "litiobr@gmail.com"
git config --global user.name "mauriciomutte"

sudo apt-get update

# -> Install Curl
# -> Install ZSH
sudo apt-get install -y \
  ubuntu-restricted-extras \
  htop \
  zsh \
  curl \
  vlc \


# -------- INSTALL APPS --------
yellow_text "-------- INSTALL APPS --------"

# -> Install Chrome
echo ""
green_text "> Downloading Google Chrome (stable_amd64)"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo ""
green_text "> Installing Google Chrome (stable_amd64)"
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# -> Install Spotify
echo ""
green_text "> Installing Spotify (using flatpak)"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get install spotify-client -y


# -> Install youtube-dl
echo ""
green_text "> Installing youtube-dl (using curl)"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl

# -------- DEVELOPMENT SETUP --------
yellow_text "-------- DEVELOPMENT SETUP --------"

# -> Install NVM
echo ""
green_text "> Installing NVM (using curl)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# -> Install NodeJS
echo ""
green_text "> Installing NodeJS (using nvm)"
nvm install --lts

node --version
npm --version

# -> Install MongoDB
sudo bash -c "$(wget -O - https://raw.githubusercontent.com/mauriciomutte/ubuntu-config/master/mongodb-ubuntu.bash)"

# -> Install build-essential
echo ""
green_text "> Installing build-essential (using apt)"
sudo apt install build-essential -y

# -> Install libssl-dev + libreadline-dev + zlib1g-dev
echo ""
green_text "> Installing libssl-dev + libreadline-dev + zlib1g-dev (using apt)"
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev -y

# -> Install Hyper
echo ""
green_text "> Installing Hyper (using apt-get)"
sudo apt install hyper
hyper i hyper-dracula

# -> Install Insomnia
echo ""
green_text "> Installing Insomnia (using snap)"
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \ | sudo tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \ | sudo apt-key add -
sudo apt-get install insomnia -y

# -> Install Yarn
echo ""
green_text "> Installing Yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn

# Clean up
sudo apt-get autoclean -y
sudo apt-get autoremove -y
