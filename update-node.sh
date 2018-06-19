#!/bin/bash

bftx0=$BFTX0_MASTER_IP
echo bftx0

ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$BFTX0_MASTER_IP  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$BFTX1_MASTER_IP  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$BFTX2_MASTER_IP  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$BFTX3_MASTER_IP  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH