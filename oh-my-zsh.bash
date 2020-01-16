#!/bin/bash

set -e

green_text(){
  echo -e "\e[32m$@\e[39m"
}


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