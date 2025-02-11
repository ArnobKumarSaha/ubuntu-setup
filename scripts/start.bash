#!/bin/bash

# Last Update : 25-1-2025
# Usage : ./start.bash

: '
	This script is intended to run
	1) In ubuntu machines >= 20.04 LTS
	2) With bash shell
'


sudo add-apt-repository universe multiverse

sudo apt update
sudo apt upgrade -y


sudo apt install curl vim tldr git git-gui -y
tldr sed

sudo apt install -y ubuntu-restricted-extras \
 software-properties-common apt-transport-https \
 linux-tools-common linux-tools-generic linux-tools-$(uname -r) \
 build-essential automake \
 terminator fish curl tree rlwrap gnome-tweaks httpie graphviz \
 python-dev-is-python3 python3-pip


bash docker.bash
bash git.bash
bash go.bash
# bash node.bash
bash ide.bash
# bash mongo.bash

bash env.bash
bash k8s.bash
# bash cloud.bash
# bash vault.bash
bash others.bash
