# Ethereum

Ethereum monitoring scripts.

## Balance check

To check the balance of a given address, run:

```console
WALLET_ADDRESS=<wallet_address> \
TAG=<tag> \
make ethereum-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<wallet_address>`|The address to get the balance of.|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
WALLET_ADDRESS=0xaA38768f31dBbc3daA45B84ABF0D39B41937b051 \
TAG=sommelier-orchestrator-balance \
make ethereum-balance-check
```
