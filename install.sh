#!/bin/bash

function setup_vim()
{
	apt install -y vim ctags
}

function setup_git()
{
	apt install -y git
}

function setup_go()
{
	local goversion=1.12.1
	local gopackage=go${goversion}.linux-amd64.tar.gz

	wget -P /tmp https://dl.google.com/go/${gopackage} \
	&& tar -C /usr/local -zxf /tmp/${gopackage} \
	&& rm /tmp/${gopackage}
}

function setup_docker()
{
	apt install -y docker
}

function setup_ipmitool()
{
	apt install -y ipmitool
}

# Required root permission
if [[ ${UID} -ne 0 ]]; then
	echo "Error: Required root permission"
	exit -1
fi

# Only support Debain like system
if [[ ! -f /etc/apt/sources.list ]]; then
	echo "Error: Not a Debain like system (debain, ubuntu ...)"
	exit -1
fi

sed -i 's/archive.ubuntu.com/mirrors.163.com/g' \
	/etc/apt/sources.list

apt-get update && apt-get upgrade -y

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		vim       ) setup_vim;;
		git       ) setup_git;;
		go        ) setup_go;;
		docker    ) setup_docker;;
		ipmitool  ) setup_ipmitool;;
	esac
done
