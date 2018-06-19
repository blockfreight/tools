#!/bin/bash

ssh -oStrictHostKeyChecking=no blockfreight-travis@104.210.61.36  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no blockfreight-travis@191.237.250.16  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no blockfreight-travis@104.45.28.199  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH

ssh -oStrictHostKeyChecking=no blockfreight-travis@13.78.36.220  <<-'ENDSSH'
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
    kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force
    rm app.yaml
ENDSSH