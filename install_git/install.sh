#!/bin/bash

echo -e "\n>>> GIT installed Started.\n"

sudo apt install -y git

git config --global user.name iamcopper
git config --global user.email kangpan519@gmail.com

git config --global push.default matching
git config --global core.editor vim

echo -e "\n>>> GIT installed finished.\n"

echo -e "\n>>> Please add the rsa-key of github manually,\n"
echo -e "\n>>> then we can use ssh protocol to git clone from github.\n"
