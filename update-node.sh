#!/bin/bash

index=0
for validator in $BFTX0_MASTER_IP $BFTX1_MASTER_IP $BFTX2_MASTER_IP $BFTX3_MASTER_IP
do
    echo $validator
    echo $index

    ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$validator  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    sed -i -- 's/<VALIDATOR_NAME>/bftx${index}/g' *
    cat app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH
    ((index+=1))
done