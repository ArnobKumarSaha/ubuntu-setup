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

    sudo echo '[Desktop Entry]
Name=Postman
GenericName=Postman
Comment=Postman API Tool
Exec=/usr/bin/postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
    ' > /usr/share/applications/postman.desktop
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
# if ! command_exists spotify; then
#     sudo apt install -y curl gnupg2 software-properties-common
#     curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | gpg --dearmor | sudo tee /usr/share/keyrings/spotify-archive-keyring.gpg > /dev/null
#     echo "deb [signed-by=/usr/share/keyrings/spotify-archive-keyring.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
#     sudo apt update
#     sudo apt install -y spotify-client
# else
#     echo "Spotify is already installed."
# fi

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