#!/bin/sh

if test ! $(which brew); then
	echo "Installing homebrew"
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

# cli tools 
#brew install ack
#brew install tree 
brew install wget
brew install gnupg gnupg2

# development tools 
brew install git 
brew install tmux
brew install zsh
brew install nvm

# install neovim 
brew install neovim/neovim/neovim

#exit 0
