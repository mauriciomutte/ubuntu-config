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
chsh -s $(which zsh) # Make default

# -> Install Oh My Zsh
echo ""
green_text "> Installing Oh My Zsh (using curl)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# -> Configure Oh My Zsh
echo ""
green_text "> Configuring Oh My Zsh"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

rm --force ~/.zshrc
mv /tmp/personal-setup/configs/.zshrc ~/



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

# -> Install Slack
echo ""
green_text "> Installing Slack (using flatpak)"
flatpak install flathub com.slack.Slack -y
flatpak override --user --env=TZ=America/Sao_Paulo com.slack.Slack

# como nao temos mais horario de verao, estou usando temporariamente
# esse TZ para o horario ficar correto, visto que o slack esta colocando
# +1hr como o horario de verao, entao preciso de um TZ com -1hr
# flatpak override --user --env=TZ=America/Campo_Grande com.slack.Slack

# -> Install Discord
echo ""
green_text "> Installing Discord (using snap)"
sudo snap install discord

# -> Install Telegram
echo ""
green_text "> Installing Telegram (using snap)"
sudo snap install telegram-desktop

# -> Install youtube-dl
echo ""
green_text "> Installing youtube-dl (using curl)"
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
