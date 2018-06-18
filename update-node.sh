#!/bin/bash

ssh -oStrictHostKeyChecking=no blockfreight-travis@191.237.250.16  <<-'ENDSSH'
    pwd
    rm app.yaml && curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
ENDSSH
