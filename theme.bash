#!/bin/bash

set -e

green_text(){
  echo -e "\e[32m$@\e[39m"
}

# -------- THEME --------

# reference: https://drasite.com/flat-remix

# Adding ppa:daniruiz/flat-remix to apt repositories
echo ""
green_text "Adding ppa:daniruiz/flat-remix to apt repositories"
sudo add-apt-repository ppa:daniruiz/flat-remix
sudo apt update

# Installing flat-remix (using apt)
echo ""
green_text "Installing flat-remix (using apt)"
sudo apt install flat-remix -y

# Installing flat-remix-gtk (using apt)
echo ""
green_text "Installing flat-remix-gtk (using apt)"
sudo apt install flat-remix-gtk -y

# gsettings list-keys org.gnome.desktop.interface
echo ""
green_text "gsettings list-keys org.gnome.desktop.interface"
gsettings set org.gnome.desktop.interface gtk-theme 'Flat-Remix-GTK-Blue-Darkest-NoBorder'
gsettings set org.gnome.desktop.interface icon-theme 'Flat-Remix-Blue-Dark'

# Installing gnome-tweak-tool (using apt)
echo ""
green_text "Installing gnome-tweak-tool (using apt)"
sudo apt install gnome-tweak-tool -y