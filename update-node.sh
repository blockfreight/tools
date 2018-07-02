#!/bin/bash

index=0
private_keys=( $PRIVATE_KEY_BFTX0 $PRIVATE_KEY_BFTX1 $PRIVATE_KEY_BFTX2 $PRIVATE_KEY_BFTX3 )
private_node_keys=( $PRIVATE_NODE_KEY_BFTX0 $PRIVATE_NODE_KEY_BFTX1 $PRIVATE_NODE_KEY_BFTX2 $PRIVATE_NODE_KEY_BFTX3 )
bftx_master_ip_array=( $BFTX0_MASTER_IP $BFTX1_MASTER_IP $BFTX2_MASTER_IP $BFTX3_MASTER_IP )

for validator in  "${bftx_master_ip_array[@]}"
do
    validator_name=bftx${index}
    private_key=${private_keys[index]}
    private_node_key=${private_node_keys[index]}

   ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$validator "env validator_name=$validator_name;\
    env private_key=$private_key;\
    env private_node_key=$private_node_key;\
    rm app.yaml;\
    kubectl delete secrets --all --grace-period=0 --force;\
    kubectl create secret generic node.private.keys --from-literal=privateKey=$private_key --from-literal=privateNodeKey=$private_node_key --from-literal=validatorName=$validator_name;\
    curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml;\
    kubectl apply -f app.yaml;\
    kubectl delete pods --all --grace-period=0 --force;" <<-'ENDSSH'

ENDSSH
    ((index+=1))
done