#!/bin/bash

if ! type git &> /dev/null; then
	echo -e "\n>>> ERR: Please install GIT firstly.\n"
	return 0;
fi

echo -e "\n>>> GO installed start.\n"

goversion="1.12.7"
gopackage="go${goversion}.linux-amd64.tar.gz"

# install go
if ! type go &> /dev/null; then
	wget -P /tmp https://dl.google.com/go/${gopackage} \
		&& sudo tar -C /usr/local -zxvf /tmp/${gopackage} \
		&& rm /tmp/${gopackage}

	export GOROOT="/usr/local/go"
	export GOPATH="${HOME}/go"
	export PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"

	mkdir -p ${GOPATH}
fi

# install go bash complete
if ! type gocomplete &> /dev/null; then
	go get -u github.com/posener/complete/gocomplete
	gocomplete -install
fi

echo -e "\n>>> GO installed finished.\n"
