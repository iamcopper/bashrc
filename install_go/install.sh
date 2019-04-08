#!/bin/bash

if ! type git &> /dev/null; then
	echo -e "\n>>> ERR: Please install GIT firstly.\n"
	return 0;
fi

echo -e "\n>>> GO installed start.\n"

# install go
if ! type go &> /dev/null; then
	local goversion="1.12.1"
	local gopackage="go${goversion}.linux-amd64.tar.gz"

	wget -P /tmp https://dl.google.com/go/${gopackage} \
		&& tar -C /usr/local -zxf /tmp/${gopackage} \
		&& rm /tmp/${gopackage}

	export GOROOT="/usr/local/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"
fi

# install go bash complete
if ! type gocomplete &> /dev/null; then
	go get -u github.com/posener/complete/gocomplete
	gocomplete -install
fi

echo -e "\n>>> GO installed finished.\n"
