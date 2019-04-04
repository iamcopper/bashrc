#!/bin/bash

function install_git()
{
	if type git &> /dev/null; then
		echo ">>> GIT has already installed."
	else
		sudo apt install -y git
	fi

	if [[ -f ${HOME}/.gitconfig ]]; then
		echo ">>> GIT has already configed."
	else
		git config --global user.name iamcopper
		git config --global user.email kangpan519@gmail.com

		git config --global push.default matching
		git config --global core.editor vim
	fi

	echo ">>> GIT installed finished."
}

function install_vim()
{
	local vim_path="${HOME}/repos/vimcfg"

	if type vim &> /dev/null; then
		echo ">>> VIM has already installed."
		return 0
	fi

	if ! type git &> /dev/null; then
		install_git
	fi

	sudo apt install -y vim ctags
	
	mkdir -p ${vim_path}
	git clone  https://github.com/iamcopper/vimcfg.git ${vim_path}
	cd ${vim_path} \
	bash install.sh \
	cd -

	vim "+:PluginInstall" "+:qa"

	echo ">>> VIM installed finished."
}

function install_go()
{
	if type go &> /dev/null; then
		echo "GO has already installed."
		return 0
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

	if type vim &> /dev/null; then
		install_vim
	fi
	# install vim-go plugin stuff
	vim "+:GoInstallBinaries"

	echo ">>> GO installed finished."
}

function install_docker()
{
	if type docker &> /dev/null; then
		echo ">>> DOCKER has already installed."
		return 0
	fi

	sudo apt install -y docker

	# TODO
	echo ">>> DOCKER installed finished."
}

function install_ipmitool()
{
	if type ipmitool &> /dev/null; then
		echo ">>> IPMITOOL has already installed."
		return 0
	fi

	sudo apt install -y ipmitool

	echo ">>> IPMITOOL installed finished."
}

if [[ ${SHELL} != "/bin/bash" ]]; then
	echo ">>> ERR: Not BASH Shell"
	exit -1
fi

if [[ ! -f /etc/apt/sources.list ]]; then
	echo ">>> ERR: Not a Debain like system (debain, ubuntu ...)"
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
done
