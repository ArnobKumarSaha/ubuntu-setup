#!/bin/bash

echo '
# Nats
export RESTIC_PASSWORD=changeit
export NATS_ADDR=nats://this-is-nats.appscode.ninja:4222
export THIS_IS_NATS_USERNAME=admin
export THIS_IS_NATS_PASSWORD="your_password_here"

# AWS
export AWS_ACCESS_KEY_ID=AKIAWSYRJ2YD7MKOK3YV
export AWS_SECRET_ACCESS_KEY="your_password_here"

# Linode
export AWS_ACCESS_KEY_ID=34F9JI2JM8DOJC6NUPII
export AWS_SECRET_ACCESS_KEY="your_password_here"

# others
export REPOSITORY=neajmorshad
export IMAGE_PULL_POLICY=IfNotPresent
export LICENSE_FILE=/home/neaj/Downloads/kind-license.txt
export GOOGLE_APPLICATION_CREDENTIALS=$HOME/yamls/gcp-creds.json
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
' >> ~/.bashrc



echo "
# GIT
alias gs 'git status'
alias gg 'git gui'
alias gac 'git add . && git commit -m'
alias gb 'git branch'
alias gco 'git checkout'
alias ga 'git add .'
alias gcm 'git commit --signoff -m'
alias gl 'git log --oneline'
alias gm 'git checkout master; git fetch --all; git pull origin master'
alias gtry 'git checkout master; git branch -D try; git fetch --all; git pull origin master; git checkout -b try'
alias gp 'git add .;git commit -a -s -m added-all;git push origin HEAD'
alias g2h 'git push origin HEAD'
alias gr 'git reset --hard HEAD'
alias ga 'git add .;git commit --amend --no-edit -a -s'

# KUBECTL
abbr --add kc kubectl
alias kg 'kubectl get'
alias ka 'kubectl apply'
alias kd 'kubectl delete'
alias kl 'kubectl logs'
alias kdb 'kubectl describe'

abbr --add kb kubebuilder
alias kk 'kubectl krew'
alias kvs 'kubectl view-secret -a'
alias dc 'docker'
alias gtv 'go mod tidy && go mod vendor'
" > ~/.config/fish/config.fish