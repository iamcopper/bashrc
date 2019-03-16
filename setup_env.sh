#!/bin/bash

#
# personal bashrc
#

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

# Go env
function set_go_env()
{
	export GOROOT="/usr/lib/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOPATH}/bin"

	# gocomplete (bash complete for go)
	complete -C /home/kang.pan/go/bin/gocomplete go
}

# http proxy
# Set the ssh client as the http proxy host
function set_http_proxy()
{
	local proxy_host=$(echo ${SSH_CLIENT} | awk '{print $1}')
	local proxy_port=1080

	export http_proxy="http://${proxy_host}:${proxy_port}"
	export https_proxy="http://${proxy_host}:${proxy_port}"
}

# ipmitool
# set the iol (ipmitool over lan) shotcut
function set_iol_shotcut()
{
	if type ipmitool > /dev/null 2>&1
	then
		alias iol='ipmitool -I lanplus -U administrator -P advantech -H'
	fi
}

export LANG=C

alias vi='vim'

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		git       ) set_git_config;;
		go        ) set_go_env;;
		httpproxy ) set_http_proxy;;
		ipmitool  ) set_iol_shotcut;;
		ipmicore  ) . setup_ipmicore_env.sh;;
	esac
done
