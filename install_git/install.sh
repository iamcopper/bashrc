#!/bin/bash

echo -e "\n>>> GIT installed Started.\n"

if ! type git &> /dev/null; then
	sudo apt install -y git
fi

if [[ ! -f ${HOME}/.gitconfig ]]; then
	git config --global user.name iamcopper
	git config --global user.email kangpan519@gmail.com

	git config --global push.default matching
	git config --global core.editor vim
fi

echo -e "\n>>> GIT installed finished.\n"
