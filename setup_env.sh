#!/bin/bash

function set_vim()
{
	alias vi='vim'
}

function set_git()
{
	return
}

function set_go()
{
	export GOROOT="/usr/local/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

	# gocomplete (bash complete for go)
	if type gocomplete &> /dev/null; then
		complete -C /home/kang.pan/go/bin/gocomplete go
	fi

	#Set http proxy for go get over the Wall
	local proxy_host=$(echo ${SSH_CLIENT} | awk '{print $1}')
	local proxy_port=1080

	export http_proxy=http://${proxy_host}:${proxy_port}
	export https_proxy=http://${proxy_host}:${proxy_port}

	#Set git proxy for go get over the Wall
	git config --global http.proxy ${http_proxy}
	git config --global https.proxy ${https_proxy}
}

function set_docker()
{
	return
}

function set_ipmitool()
{
	alias iol='ipmitool -I lanplus -U administrator -P advantech -H'
}

export LANG=C

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		vim       ) set_vim;;
		git       ) set_git;;
		go        ) set_go;;
		docker    ) set_docker;;
		ipmitool  ) set_ipmitool;;
		ipmicore  )
			curdir=$(dirname ${BASH_SOURCE[0]})
			. ${curdir}/setup_ipmicore_env.sh
			;;
	esac
done
