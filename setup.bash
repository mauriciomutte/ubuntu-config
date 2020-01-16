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
