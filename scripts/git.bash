#!/bin/bash

: '
	This script takes two ENV GITHUB_USER & GITHUB_TOKEN
    You can get a PAT from github -> settings -> developer settings -> Create Personal access token
'

git config --global user.name "Neaj Morshad"
git config --global user.email neaj@appscode.com

ssh-keygen -t rsa -C "neaj@appscode.com"
ps -e  | grep [s]sh-agent
ssh-add ~/.ssh/id_rsa
ssh-add -l
cat ~/.ssh/id_rsa.pub


echo "Now go to your github settings -> ssh page, & add this new one."
TEXT="done"
echo "Waiting for text: $TEXT"

while true; do
    read -r line
    echo "$line" | grep -q "$TEXT" && break
done



git config --global \
url."https://"$GITHUB_USER":"$GITHUB_TOKEN"@github.com".insteadOf \
"https://github.com"
go env -w GOPRIVATE='github.com/appscode/*,go.appscode.dev/*,kubedb.dev/*,github.com/ak8sdb/*,kubeops.dev/*,go.bytebuilders.dev/*,kubepack.dev/*,kubestash.dev/*,stash.appscode.dev/*'


bash repo-clone.bash

