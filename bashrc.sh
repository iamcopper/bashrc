#!/bin/bash

#
# personal bashrc
#

export LANG=C

alias vi='vim'

# http proxy
# The ssh client is the http proxy host
proxy_host=$(echo ${SSH_CLIENT} | awk '{print $1}')
proxy_port=1080
export http_proxy="http://${proxy_host}:${proxy_port}"
export https_proxy="http://${proxy_host}:${proxy_port}"

# Go
export GOROOT="/usr/lib/go"
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# gocomplete (bash complete for go)
complete -C /home/kang.pan/go/bin/gocomplete go

# Git Config
if type git > /dev/null && ! git config --get user.name > /dev/null
then
	# default user name and email
	git config --global user.name iamcopper
	git config --global user.email kangpan519@gmail.com

	# using SSH instead of HTTPS
	git config --global url.git@:.insteadOf https://
fi
