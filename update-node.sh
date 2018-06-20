#!/bin/bash

for i in 0 1 2 3
do
    ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$BFTX$i_MASTER_IP  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    sed -i 's/<VALIDATOR_NAME>/bftx$i' app2.yaml
    cat app2.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH
done