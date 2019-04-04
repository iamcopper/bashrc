#!/bin/bash

if type go &> /dev/null; then
	echo -e "\nGO has already installed.\n"
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

echo -e "\n>>> GO installed finished.\n"


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
