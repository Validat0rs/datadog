# Ethereum

Ethereum monitoring scripts.

## Balance check

To check the balance of a given address, run:

```console
ADDRESS=<address> \
TAG=<tag> \
make ethereum-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<address>`|The address to get the balance of.|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
ADDRESS=0xaA38768f31dBbc3daA45B84ABF0D39B41937b051 \
TAG=sommelier-orchestrator-balance \
make ethereum-balance-check
```
