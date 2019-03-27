#!/bin/bash

#
# personal bashrc
#

# Git Config
function set_git_config()
{
	local proxy_host=$(echo ${SSH_CLIENT} | awk '{print $1}')
	local proxy_port=1080

	if [[ -f ${HOME}/.gitconfig ]]
	then
		git config --global http.proxy ${proxy_host}:${proxy_port}
		git config --global https.proxy ${proxy_host}:${proxy_port}

		return
	fi

	if type git > /dev/null 2>&1
	then
		git config --global user.name iamcopper
		git config --global user.email kangpan519@gmail.com

		git config --global push.default matching
		git config --global core.editor vim

		git config --global http.proxy ${proxy_host}:${proxy_port}
		git config --global https.proxy ${proxy_host}:${proxy_port}

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

# ipmitool
# set the iol (ipmitool over lan) shotcut
function set_iol_shotcut()
{
	alias iol='ipmitool -I lanplus -U administrator -P advantech -H'
}

export LANG=C

alias vi='vim'

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		git       ) set_git_config;;
		go        ) set_go_env;;
		ipmitool  ) set_iol_shotcut;;
		ipmicore  )
			DIR=$(dirname ${BASH_SOURCE[0]})
			. ${DIR}/setup_ipmicore_env.sh
			;;
	esac
done
