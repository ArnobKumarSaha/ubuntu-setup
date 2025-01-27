#! /bin/bash

GO_SRC=/home/$USER/go/src/

# curl -L \
#   -H "Accept: application/vnd.github+json" \
#   -H "Authorization: Bearer <YOUR-TOKEN>" \
#   -H "X-GitHub-Api-Version: 2022-11-28" \
#   https://api.github.com/orgs/ORG/repos


declare -A ar
ar[0]="kubedb.dev kubedb apimachinery autoscaler cli crd-manager db-client-go docs elasticsearch installer kafka mariadb
        mssqlserver mssql-coordinator mssql-init-docker mongodb mongodb-init-docker mongodb-restic-plugin mysql ops-manager postgres redis schema-manager tests ui-server webhook-server"

ar[1]="kubeops.dev kubeops falco-ui-server installer panopticon scanner sidekick trivydb-docker ui-server"
ar[2]="go.bytebuilders.dev appscode-cloud b3 catalog catalog-manager cluster-presets cluster-ui grafana installer kubedb-ui platform-ui launchpad
         lib-selfhost license-proxyserver service-provider ui-wizards"

ar[4]="stash.appscode.dev stashed apimachinery enterprise installer mongodb"
ar[5]="kubestash.dev kubestash addon-template apimachinery installer kubedb-manifest kubestash"

ar[5]="kmodules.xyz kmodules client-go codespan-schema-checker controller-runtime custom-resources offshoot-api resource-metadata resource-metrics webhook-runtime"
ar[6]="kubepack.dev kubepack chart-doc-gen kubepack lib-app lib-helm"
ar[7]="go.appscode.dev appscode alerts blog grafana-dashboards"
ar[8]="github.com/Neaj-Morshad-101 yamls SQL-Server-Kubernetes-Operator"


for i in ${!ar[@]}
do
    x=${ar[$i]}
    line=($x)

    mkdir -p ${GO_SRC}/${line[0]}
    cd ${GO_SRC}/${line[0]}

   for (( i=2; i<${#line[@]}; i++ ));
    do
        git clone git@github.com:${line[1]}/${line[$i]}.git
    done
done


# Different approach
# repos=(kubestash.dev kubestash addon-template apimachinery installer kubedb-manifest kubestash mongodb)

# for repo in ${repos[@]}
# do
#     git clone git@github.com:${ORG}/${repo}.git
# done
