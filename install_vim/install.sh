#!/bin/bash

echo -e "\n>>> VIM installed started\n"

sudo apt install -y vim ctags

# copy files
if [[ -d ~/.vim/bundle ]]; then
	plug_num=$(ls -l ~/.vim/bundle | wc -l)
else
	rm -rf ~/.vim
	plug_num=0
fi
if [[ $plug_num -le 2 ]]; then
	git clone git@//github.com:VundleVim/Vundle.vim.git ./vimfile/bundle/Vundle.vim
	cp -r ./vimfile ~/.vim
fi

cp ./vimrc ~/.vimrc

# The deoplete.nvim plugin is rely on the neovim/pynvim,
# so install it first.
sudo apt install python3-pip
pip3 install pynvim

# Install all plugins
vim "+:PluginInstall" "+:qa"

# Install vim-go plugin stuff
vim "+:GoInstallBinaries"

echo -e "\n>>> VIM installed finished.\n"
