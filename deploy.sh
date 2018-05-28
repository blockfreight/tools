#!/bin/bash
validators[0]="ssh gian@$VALIP_0"
validators[1]="ssh gian@$VALIP_1"
validators[2]="ssh gian@$VALIP_2"
validators[3]="ssh gian@$VALIP_3"

for validator in validators
do
    echo "Accessing $validator"
    eval validator
    echo "Cleaning up the cluster"
    kubectl delete pods --all --grace-period=0 --force && kubectl delete -f app.yaml
    echo "Deleting current app.yaml file"
    rm app.yaml
    echo "Downloading latest app.yaml file from github.com/blockfreight/tools/ master branch"
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    echo "Creating nodes using the new app.yaml file"
    kubectl create -f app.yaml
done