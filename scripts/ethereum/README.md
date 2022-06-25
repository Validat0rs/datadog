# Ethereum

Ethereum monitoring scripts.

## Balance check

### Sommelier

To check the sommelier signer balance, run:

```console'
ETHPLORER_API_KEY=<ethplorer_api_key> \
WALLET_ADDRESS=<wallet_address> \
TAG=<tag> \
make ethereum-sommelier-signer-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<ethplorer_api_key>`|[Ethplorer](https://ethplorer.io/) API key.|
|`<wallet_address>`|The sommelier signer address to get the balance of.|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
ETHPLORER_API_KEY=EL-aaBll-G4a51FI-fp59e \
WALLET_ADDRESS=0xaA38768f31dBbc3daA45B84ABF0D39B41937b051 \
TAG=sommelier-orchestrator-balance \
make ethereum-sommelier-signer-balance-check
```
