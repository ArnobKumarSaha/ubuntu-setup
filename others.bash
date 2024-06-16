#!/bin/bash

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install Chrome
if ! command_exists google-chrome; then
    curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb --output google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt install -f -y
    rm google-chrome-stable_current_amd64.deb
else
    echo "google-chrome is already installed."
fi


# Install Postman
if ! command_exists postman; then
    wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
    sudo tar -xzf postman.tar.gz -C /opt
    sudo ln -s /opt/Postman/Postman /usr/bin/postman
    rm postman.tar.gz
else
    echo "Postman is already installed."
fi

# Install qBittorrent
if ! command_exists qbittorrent; then
    sudo apt install -y qbittorrent
else
    echo "qBittorrent is already installed."
fi

# Install Spotify
if ! command_exists spotify; then
    curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install -y spotify-client
else
    echo "Spotify is already installed."
fi

# Install VLC
if ! command_exists vlc; then
    sudo apt-get install -y vlc
else
    echo "VLC is already installed."
fi


# Install Zoom
if ! command_exists zoom; then
    wget -O "zoom_latest_amd64.deb" "https://zoom.us/client/latest/zoom_amd64.deb"
    sudo dpkg -i zoom_latest_amd64.deb
    sudo apt-get install -f -y
    rm zoom_latest_amd64.deb
else
    echo "Zoom is already installed."
fi