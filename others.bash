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

# Install Discord
if ! command_exists discord; then
    DISCORD_VERSION=0.0.81
    wget https://dl.discordapp.net/apps/linux/$DISCORD_VERSION/discord-$DISCORD_VERSION.deb
    sudo dpkg -i discord-$DISCORD_VERSION.deb
    sudo apt-get install -f -y
    rm discord-$DISCORD_VERSION.deb
else
    echo "discord is already installed."
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
if ! command_exists spotify; then
    # https://www.spotify.com/de-en/download/linux/
    curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
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

# Install trivy
if ! command_exists trivy; then
    sudo apt-get install -y --no-install-recommends wget apt-transport-https gnupg lsb-release
    wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
    echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends trivy
else
    echo "Trivy is already installed."
fi


# Install yq
if ! command_exists yq; then
    curl -fsSL -o yqq https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64
    chmod +x yqq
    sudo mv yqq /usr/local/bin/yqq
    sudo apt install pipx
    pipx install yq
else
    echo "yq is already installed."
fi