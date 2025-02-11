#!/bin/bash


if ! command -v go &> /dev/null; then
	if [ "$#" == 1 ]; then
		GO_VERSION="$1"
	else
		GO_VERSION=1.23.5
	fi
	wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz
	if [ $? != 0 ]; then
		echo "Go version ${GO_VERSION} not available. "
		exit 1
	fi
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz


	# Add environment variables to ~/.bashrc file
	str=$'export GOPATH=$HOME/go\n'
	str+=$'export GOROOT=/usr/local/go\n'
	str+=$'export GOBIN=$HOME/go/bin\n'
	str+=$'export PATH=$GOBIN:$GOROOT/bin:$PATH\n'
	cat <(echo "${str}" ) >> $HOME/.bashrc

	source $HOME/.bashrc
	rm go${GO_VERSION}.linux-amd64.tar.gz
        echo "Need to source your bashrc / fishrc file now."
else
    echo "go is already installed."
fi



