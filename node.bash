#!/bin/bash


if ! command -v node &> /dev/null; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    source $HOME/.bashrc
    # nvm should be available in bash now

    nvm install 18.20.3
    echo "npm version $(npm -v)"
    echo "node version $(node -v)"
else
    echo "node is already installed."
fi
