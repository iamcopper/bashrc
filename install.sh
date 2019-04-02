#!/bin/bash

function install_vim()
{
	if type vim &> /dev/null; then
		echo "vim has already installed."
		return
	fi

	apt install -y vim ctags
}

function install_git()
{
	if type git &> /dev/null; then
		echo "git has already installed."
		return
	fi

	apt install -y git

	git config --global user.name iamcopper
	git config --global user.email kangpan519@gmail.com

	git config --global push.default matching
	git config --global core.editor vim
}

function install_go()
{
	if type go &> /dev/null; then
		echo "go has already installed."
		return
	fi

	local goversion="1.12.1"
	local gopackage="go${goversion}.linux-amd64.tar.gz"

	wget -P /tmp https://dl.google.com/go/${gopackage} \
	&& tar -C /usr/local -zxf /tmp/${gopackage} \
	&& rm /tmp/${gopackage}
}

# install go bash complete
function install_gocomplete()
{
	if type gocomplete &> /dev/null; then
		echo "gocomplete has already installed."
		return
	fi

	go get -u github.com/posener/complete/gocomplete
	gocomplete -install
}

function install_docker()
{
	if type docker &> /dev/null; then
		echo "docker has already installed."
		return
	fi

	apt install -y docker
}

function install_ipmitool()
{
	if type ipmitool &> /dev/null; then
		echo "ipmitool has already installed."
		return
	fi

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

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		vim)
			install_vim;;
		git)
			install_git;;
		go)
			install_go
			. setup_env.sh go
			install_gocomplete
			;;
		docker)
			install_docker;;
		ipmitool)
			install_ipmitool;;
	esac

	. setup_env.sh ${!i}
done
