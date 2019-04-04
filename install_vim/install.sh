#!/bin/bash

echo -e "\n>>> VIM installed started\n"

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

# Install Plugin
vim "+:PluginInstall" "+:qa"

# install vim-go plugin stuff
vim "+:GoInstallBinaries"

echo -e "\n>>> VIM installed finished.\n"
