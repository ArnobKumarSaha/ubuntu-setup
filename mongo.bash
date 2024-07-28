#!/bin/bash

if ! command -v mongosh &> /dev/null; then
    curl https://downloads.mongodb.com/compass/mongodb-mongosh_2.2.12_amd64.deb -o mongosh_2.2.12_amd64.deb
    sudo dpkg -i mongosh_2.2.12_amd64.deb
    sudo apt install -f
    rm mongosh_2.2.12_amd64.deb
else
    echo "mongosh is already installed."
fi

if ! command -v mongodb-compass &> /dev/null; then
    curl https://downloads.mongodb.com/compass/mongodb-compass_1.43.4_amd64.deb -o compass_1.43.4_amd64.deb
    arnob@msi ~> sudo dpkg -i compass_1.43.4_amd64.deb
    sudo apt install -f
    rm compass_1.43.4_amd64.deb
else
    echo "mongodb-compass is already installed."
fi
