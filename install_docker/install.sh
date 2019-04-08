#!/bin/bash

if type docker &> /dev/null; then
	echo ">>> DOCKER has already installed."
	return 0
fi

sudo apt install -y docker

# TODO
echo ">>> DOCKER installed finished."
