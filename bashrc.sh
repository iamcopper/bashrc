#!/bin/bash

#
# personal bashrc
#

# Go env
function set_go_env()
{
	export GOROOT="/usr/lib/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOPATH}/bin"

	# gocomplete (bash complete for go)
	complete -C /home/kang.pan/go/bin/gocomplete go
}


# Git Config
function set_git_config()
{
	if type git > /dev/null 2>&1 && ! git config --get user.name > /dev/null 2>&1
	then
		# set default user name and email
		git config --global user.name iamcopper
		git config --global user.email kangpan519@gmail.com

		# using SSH instead of HTTPS
		git config --global url.git@:.insteadOf https://
	fi
}

# http proxy
function set_http_proxy()
{
	# Set the ssh client as the http proxy host
	local proxy_host=$(echo ${SSH_CLIENT} | awk '{print $1}')
	local proxy_port=1080

	export http_proxy="http://${proxy_host}:${proxy_port}"
	export https_proxy="http://${proxy_host}:${proxy_port}"
}

export LANG=C

alias vi='vim'

set_go_env
set_git_config
set_http_proxy
