#!/bin/bash

mkdir -p $HOME/go/src/kubedb.dev
mkdir -p $HOME/go/src/kubestash.dev
mkdir -p $HOME/go/src/kubeops.dev
base_dir="$HOME/go/src/kubedb.dev"
kubedbRepo=("apimachinery" "provisioner" "webhook-server" "installer" "crd-manager" "mysql" "mysql-init-docker" "mysql-coordinator" "mysql-restic-plugin" "mysql-archiver"  "mysql-csi-snapshotter-plugin" "mariadb" "mariadb-init-docker" "mariadb-coordinator" "mariadb-archiver" "mariadb-csi-snapshotter-plugin" "mariadb-restic-plugin" "clickhouse" "clickhouse-init-docker")

# Loop through each repository
for repo in "${kubedbRepo[@]}"; do
  echo "processing $repo"
  cd $base_dir
  # Clone or pull the repository
  if [[ -d "$base_dir/$repo" ]]; then
    echo "repo exists so skipping: $repo"
  else
    echo "Cloning repository: "
    gitUrl="git@github.com:kubedb/$repo.git"
    git clone $gitUrl
  fi
done

echo "All repositories processed."