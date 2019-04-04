#!/bin/bash

function install_git()
{
	if type git &> /dev/null; then
		echo "git has already installed."
		return
	fi

	sudo apt install -y git

	git config --global user.name iamcopper
	git config --global user.email kangpan519@gmail.com

	git config --global push.default matching
	git config --global core.editor vim
}

function install_vim()
{
	local vim_path="~/repos/vimcfg"

	if type vim &> /dev/null; then
		return
	fi

	if ! type git &> /dev/null; then
		install_git
	fi

	sudo apt install -y vim ctags
	
	mkdir -p ${vim_path}
	git clone  git@github.com:iamcopper/vimcfg.git ${vim_path}
	bash ${vim_path}/install.sh

	vim "+:PluginInstall" "+:qa"
}

function install_go()
{
	if type go &> /dev/null; then
		echo "go has already installed."
		return
	fi

	if type vim &> /dev/null; then
		install_vim
	fi

	local goversion="1.12.1"
	local gopackage="go${goversion}.linux-amd64.tar.gz"

	wget -P /tmp https://dl.google.com/go/${gopackage} \
	&& tar -C /usr/local -zxf /tmp/${gopackage} \
	&& rm /tmp/${gopackage}

	export GOROOT="/usr/local/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

	# install go bash complete
	go get -u github.com/posener/complete/gocomplete
	gocomplete -install

	# install vim-go plugin stuff
	vim "+:GoInstallBinaries"
}

function install_docker()
{
	if type docker &> /dev/null; then
		echo "docker has already installed."
		return
	fi

	sudo apt install -y docker

	# TODO
}

function install_ipmitool()
{
	if type ipmitool &> /dev/null; then
		echo "ipmitool has already installed."
		return
	fi

	sudo apt install -y ipmitool
}

if [[ ${SHELL} != "/bin/bash" ]]; then
	echo "Error: Not BASH Shell"
	exit -1
fi

if [[ ! -f /etc/apt/sources.list ]]; then
	echo "Error: Not a Debain like system (debain, ubuntu ...)"
	exit -1
fi

curdir=$(dirname ${BASH_SOURCE[0]})

for (( i = 1; i <= $#; i++ ));
do
	case ${!i} in
		git       ) install_git;;
		vim       ) install_vim;;
		go        ) install_go;;
		docker    ) install_docker;;
		ipmitool  ) install_ipmitool;;
	esac

	. ${curdir}/setup_env.sh ${!i}
done
