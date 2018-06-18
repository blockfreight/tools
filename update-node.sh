#!/bin/bash

rm app.yaml && curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml
kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force