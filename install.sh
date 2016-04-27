#!/bin/bash

echo "Installing dotfiles"

echo "Initializing submodule(s)"

git submodule update --init --recursive

source install/bash.sh
source install/link.sh

if [ "$(uname)" == "Darwin" ]; then
	echo -e "\n\nRunning on OSX"

	source install/brew.sh
	source install/osx.sh
	source install/rvm.sh
	source install/nvm.sh

	#create a backup of the original nginx.conf
	# mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.original
	# ln -s ~/.dotfiles/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf
	# symlink the code.dev from dotfiles
	# ln -s ~/dotfiles/nginx/code.dev /usr/local/etc/nginx/sites-enabled/code.dev
fi

echo -e "\n\nInstalling Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo -e "\n\nConfiguring zsh as default shell"
echo "=============================="

# chsh -s $(which zsh)
# chsh -s $(which bash)

echo "Done."
