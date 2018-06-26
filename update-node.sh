#!/bin/bash

index=0
for validator in $BFTX0_MASTER_IP # $BFTX1_MASTER_IP $BFTX2_MASTER_IP $BFTX3_MASTER_IP
do
    validator_name=bftx${index}
    private_type=${PRIVATE_KEY_TYPE}
    private_key='$PRIV_KEY+$index'
    echo $private_type;
    echo $private_key;

   ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$validator "env validator_name=$validator_name;echo $private_type;echo $private_key;curl https://raw.githubusercontent.com/blockfreight/tools/master/blockfreightnet-kubernetes/examples/blockfreight/app.yaml > app.yaml;sed -i -- 's/<VALIDATOR_NAME>/'$validator_name'/g' *;sed -i -- 's/<PRIVATE_KEY>/'$private_key'/g' *;sed -i -- 's/<PRIVATE_TYPE>/'$private_type'/g' *;cat app.yaml; rm app.yaml;" <<-'ENDSSH'
    
ENDSSH
    ((index+=1))
done