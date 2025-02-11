#!/bin/bash

if ! command -v gcloud &> /dev/null; then
# https://cloud.google.com/sdk/docs/install#deb
    sudo apt update
    sudo apt install apt-transport-https ca-certificates gnupg curl
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    sudo apt update && sudo apt install google-cloud-cli -y
    gcloud init
else
    echo "gcloud is already installed."
fi

if ! command -v aws &> /dev/null; then
# https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    sudo ./aws/install
    rm awscliv2.zip
    rm -rf aws
else
    echo "aws is already installed."
fi


if ! command -v eksctl &> /dev/null; then
    # https://eksctl.io/installation/
    ARCH=amd64
    PLATFORM=$(uname -s)_$ARCH

    curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

    # (Optional) Verify checksum
    curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

    tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

    sudo mv /tmp/eksctl /usr/local/bin
else
    echo "eksctl is already installed."
fi


if ! command -v az &> /dev/null; then
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
else
    echo "az is already installed."
fi


if ! command -v doctl &> /dev/null; then
# https://docs.digitalocean.com/reference/doctl/how-to/install/
    wget https://github.com/digitalocean/doctl/releases/download/v1.120.1/doctl-1.120.1-linux-amd64.tar.gz
    tar xf doctl-1.120.1-linux-amd64.tar.gz
    sudo mv doctl /usr/local/bin
    rm doctl-1.120.1-linux-amd64.tar.gz
else
    echo "doctl is already installed."
fi


if ! command -v s3cmd &> /dev/null; then
# https://www.linode.com/docs/products/storage/object-storage/guides/s3cmd/#configuring-s3cmd
    sudo apt install s3cmd
    s3cmd --configure
    # S3 Endpoint: us-east-1.linodeobjects.com
    # DNS-style bucket+hostname: %(bucket)s.us-east-1.linodeobjects.com
    # Test access with supplied credentials? n
else
    echo "s3cmd is already installed."
fi



if ! command -v clusterctl &> /dev/null; then
# https://cluster-api.sigs.k8s.io/user/quick-start#install-clusterctl
    curl -L https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.9.4/clusterctl-linux-amd64 -o clusterctl
    sudo install -o root -g root -m 0755 clusterctl /usr/local/bin/clusterctl
    rm clusterctl
else
    echo "clusterctl is already installed."
fi
