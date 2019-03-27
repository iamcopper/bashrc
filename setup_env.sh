#!/bin/bash

#
# personal bashrc
#

# Git Config
function set_git_config()
{
	if [[ -f ${HOME}/.gitconfig ]]
	then
		return
	fi

	if type git > /dev/null 2>&1
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
