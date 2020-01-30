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

# -> Install Curl
echo ""
green_text "> Installing curl (using apt)"
sudo apt install curl -y

# -> Install Flatpak
echo ""
green_text "> Installing flatpak (using apt)"
sudo apt install flatpak -y

echo ""
green_text "> Installing gnome-software-plugin-flatpak (using apt)"
sudo apt install gnome-software-plugin-flatpak -y

# -> Configure Flathub
echo ""
green_text "> Adding flathub to flatpak"
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# -> Install ZSH
echo ""
green_text "> Installing ZSH (using snap)"
sudo apt install zsh
zsh --version



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
flatpak install flathub com.spotify.Client -y

# -> Install Discord
echo ""
green_text "> Installing Discord (using snap)"
sudo snap install discord

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# -> Install NodeJS
echo ""
green_text "> Installing NodeJS (using nvm)"
nvm install --lts

node --version
npm --version

# -> Install build-essential
echo ""
green_text "> Installing build-essential (using apt)"
sudo apt install build-essential -y

# -> Install libssl-dev + libreadline-dev + zlib1g-dev
echo ""
green_text "> Installing libssl-dev + libreadline-dev + zlib1g-dev (using apt)"
sudo apt install -y libssl-dev libreadline-dev zlib1g-dev -y

# -> Install VSCode
echo ""
green_text "> Installing Visual Studio Code (using snap)"
sudo snap install code --classic

# -> Install Hyper
echo ""
green_text "> Installing Hyper (using apt-get)"
sudo apt install hyper
hyper i hyper-dracula

# -> Install Insomnia
echo ""
green_text "> Installing Insomnia (using snap)"
sudo snap install insomnia

# -> Install Postman
echo ""
green_text "> Installing Postman (using flatpak)"
flatpak install flathub com.getpostman.Postman

# -> Install Heroku
echo ""
green_text "> Installing Heroku (using snap)"
sudo snap install --classic heroku

# -> Install Yarn
echo ""
green_text "> Installing Yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn


# -------- THEME SETUP --------
yellow_text "-------- THEME SETUP --------"
bash /tmp/personal-setup/theme.bash