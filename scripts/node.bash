#!/bin/bash


if ! command -v node &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    source $HOME/.bashrc
    # nvm should be available in bash now

    nvm install 20
    nvm use 22
    nvm alias default 22

    echo "npm version $(npm -v)"
    echo "node version $(node -v)"
else
    echo "node is already installed."
fi
