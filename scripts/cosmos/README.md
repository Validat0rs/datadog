# Cosmos

Cosmos monitoring.

## General

General purpose scripts for any Cosmos chain.

### Balance check

#### IBC

To check the balance of an IBC address, run:

```console
NODE_ADDRESS=<api_node> \
WALLET_ADDRESS=<wallet_address> \
PROJECT_NAME=<project_name> \
TAG=<tag> \
make cosmos-ibc-balance-check
```

where:

| Param              | Description                                                                        |
|--------------------|------------------------------------------------------------------------------------|
| `<api_node>`       | The API node address (including protocol, e.g.: `https://cosmos-api.validat0.rs`). |
| `<wallet_address>` | The restake address to get the balance of.                                         |
| `<project_name>`   | The name of the project or client relaying for (e.g.: `cosmoshub`)                 |
| `<tag>`            | The name of the DataDog tag for this metric.                                       |

e.g.:

```console
NODE_ADDRESS=https://cosmos-api.validat0.rs \
WALLET_ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
PROJECT_NAME=cosmoshub \
TAG=cosmoshub-restake-balance \
make cosmos-ibc-balance-check
```

#### Restake

To check the balance of a given restake address, run:

```console
NODE_ADDRESS=<api_node> \
WALLET_ADDRESS=<wallet_address> \
TAG=<tag> \
make cosmos-restake-balance-check
```

where:

| Param              | Description                                                                        |
|--------------------|------------------------------------------------------------------------------------|
| `<api_node>`       | The API node address (including protocol, e.g.: `https://cosmos-api.validat0.rs`). |
| `<wallet_address>` | The restake address to get the balance of.                                         |
| `<tag>`            | The name of the DataDog tag for this metric.                                       |

e.g.:

```console
NODE_ADDRESS=https://cosmos-api.validat0.rs \
WALLET_ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
TAG=cosmoshub-restake-balance \
make cosmos-restake-balance-check
```

