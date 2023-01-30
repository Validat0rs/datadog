# Sommelier

Sommelier specific scripts.

## Orchestrator Balance

To check the sommelier orchestrator balance, run:

```console
NODE_ADDRESS=<api_node> \
WALLET_ADDRESS=<wallet_address> \
TAG=<tag> \
make cosmos-sommelier-orchestrator-balance-check
```

where:

| Param              | Description                                                                        |
|--------------------|------------------------------------------------------------------------------------|
| `<api_node>`       | The API node address (including protocol, e.g.: `https://cosmos-api.validat0.rs`). |
| `<wallet_address>` | The sommelier orchestrator address to get the balance of.                          |
| `<tag>`            | The name of the DataDog tag for this metric.                                       |

e.g.:

```console
NODE_ADDRESS=https://cosmos-api.validat0.rs \
WALLET_ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
TAG=cosmoshub-restake-balance \
make cosmos-sommelier-orchestrator-balance-check
```
