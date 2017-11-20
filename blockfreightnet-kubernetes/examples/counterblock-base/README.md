# Blockfreight™ example

This is an example of using [blockfreight](https://github.com/blockfreight/go-bftx).

## Usage

```
make create
```

### Check account balance and send a transaction

1. wait until all the pods are `Running`.

   ```
   kubectl get pods -w -o wide -L bftx
   ```

2. wait until app starts.

   ```
   kubectl logs -c app -f bftx-0
   ```

3. get account's address of the second pod

   ```
   ADDR=`kubectl exec -c app bftx-1 -- cat /app/key.json | jq ".address" | tr -d "\""`
   ```

4. send 5 coins to it from the first pod

   ```
   kubectl exec -c app bftx-0 -- bftx construct bf_tx_example.json --chain_id chain-IdealX
   ```


## Clean up

```
make destroy
```
