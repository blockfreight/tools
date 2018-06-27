#!/bin/bash

index=0
private_keys=( $PRIVATE_KEY_BFTX0 $PRIVATE_KEY_BFTX1 $PRIVATE_KEY_BFTX2 $PRIVATE_KEY_BFTX3 )
private_node_keys=( $PRIVATE_NODE_KEY_BFTX0 $PRIVATE_NODE_KEY_BFTX1 $PRIVATE_NODE_KEY_BFTX2 $PRIVATE_NODE_KEY_BFTX3 )
for validator in $BFTX0_MASTER_IP $BFTX1_MASTER_IP $BFTX2_MASTER_IP $BFTX3_MASTER_IP
do
    validator_name=bftx${index}
    private_type=${PRIVATE_KEY_TYPE}
    private_key=${private_keys[index]}
    private_node_key=${private_node_keys[2]}

   ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$validator "env validator_name=$validator_name;rm app.yaml;curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml;sed -i -- 's/<VALIDATOR_NAME>/$validator_name/g' app.yaml;sed -i -- 's/<PRIVATE_KEY>/$private_key/g' app.yaml;sed -i -- 's/<PRIVATE_TYPE>/$private_type/g' app.yaml;cat app.yaml;kubectl apply -f app.yaml && kubectl delete pods --all --grace-period=0 --force;rm app2.yaml pre_app.yaml" <<-'ENDSSH'

ENDSSH
    ((index+=1))
done