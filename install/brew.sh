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
brew install vim
brew install wget
brew install gnupg gnupg2
brew tap caskroom/cask
brew install coreutils
brew install terminal-notifier

# development tools
brew install git
brew install tmux
brew install zsh zsh-completions
brew install nvm
brew install fzf

/usr/local/opt/fzf/install

# install neovim
brew install neovim/neovim/neovim
brew install reattach-to-user-namespace

#exit 0
