#!/bin/bash

git config --global user.name "Arnob kumar saha"
git config --global user.email arnob@appscode.com

ssh-keygen -t rsa -C "arnob@appscode.com"
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

bash repo-clone.bash