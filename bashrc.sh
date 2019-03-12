#!/bin/bash

#
# personal bashrc
#

export LANG=C

alias vi='vim'

# http proxy
export http_proxy="http://172.21.73.107:1080"
export https_proxy="http://172.21.73.107:1080"

# Go
export GOROOT="/usr/lib/go"
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# gocomplete (bash complete for go)
complete -C /home/kang.pan/go/bin/gocomplete go
