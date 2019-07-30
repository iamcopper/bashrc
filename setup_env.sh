#!/bin/bash

function set_vim()
{
	alias vi='vim'
}

function set_git()
{
	return 0
}

function set_go()
{
	export GOROOT="/usr/local/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

#	export GOPROXY="https://goproxy.io"

	complete -C /home/kang.pan/go/bin/gocomplete go
}

function set_proxy()
{
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
	return 0
}

function set_ipmitool()
{
	alias iol='ipmitool -I lanplus -U administrator -P advantech -H'
}

#export LANG=C
export LANG="zh_CN.UTF-8"

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		vim       ) set_vim;;
		git       ) set_git;;
		go        ) set_go;;
		proxy     ) set_proxy;;
		docker    ) set_docker;;
		ipmitool  ) set_ipmitool;;
		ipmicore  )
			CURPATH=$(dirname ${BASH_SOURCE[0]})
			. ${CURPATH}/setup_ipmicore_env.sh
			;;
	esac
done
