#!/bin/bash

# https://www.mongodb.com/try/download/shell
MONGOSH_VERSION=2.3.8
COMPASS_VERSION=1.45.1

if ! command -v mongosh &> /dev/null; then
    curl https://downloads.mongodb.com/compass/mongodb-mongosh_${MONGOSH_VERSION}_amd64.deb -o mongosh_${MONGOSH_VERSION}_amd64.deb
    sudo dpkg -i mongosh_${MONGOSH_VERSION}_amd64.deb
    sudo apt install -f
    rm mongosh_${MONGOSH_VERSION}_amd64.deb
else
    echo "mongosh is already installed."
fi

if ! command -v mongodb-compass &> /dev/null; then
    curl https://downloads.mongodb.com/compass/mongodb-compass_${COMPASS_VERSION}_amd64.deb -o compass_${COMPASS_VERSION}_amd64.deb
    arnob@msi ~> sudo dpkg -i compass_${COMPASS_VERSION}_amd64.deb
    sudo apt install -f
    rm compass_${COMPASS_VERSION}_amd64.deb
else
    echo "mongodb-compass is already installed."
fi
