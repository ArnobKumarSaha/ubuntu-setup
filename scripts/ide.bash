#!/bin/bash


# Sublime-text
if ! command -v subl &> /dev/null; then
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text
else
    echo "Sublime Text is already installed."
fi


# VSCode
if ! command -v code &> /dev/null; then
    wget -O "vscode_latest_amd64.deb" "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"
    sudo dpkg -i vscode_latest_amd64.deb
    sudo apt-get install -f -y
    rm vscode_latest_amd64.deb
else
    echo "VSCode is already installed."
fi


# Jetbrains toolbox
if ! command -v /opt/jetbrains/jetbrains-toolbox &> /dev/null; then
    wget -O "jetbrains-toolbox.tar.gz" "https://data.services.jetbrains.com/products/download?code=TB&platform=linux"
    sudo mkdir -p /opt/jetbrains
    sudo tar -xvzf jetbrains-toolbox.tar.gz -C /opt/jetbrains --strip-components=1

    rm jetbrains-toolbox.tar.gz
    sudo apt install libfuse2
    /opt/jetbrains/jetbrains-toolbox
else
    echo "Jetbrains toolbox is already installed."
fi

