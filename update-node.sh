#!/bin/bash

echo $BLOCKFREIGHT_SSH_USER
echo '$BLOCKFREIGHT_SSH_USER'
echo '$3'
echo '$4'
echo '$5'

ssh -oStrictHostKeyChecking=no $1@$2  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $1@$3  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $1@$4  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no $1@$5  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH