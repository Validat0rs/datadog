# Cosmos

Cosmos monitoring.

## General

General purpose scripts for any Cosmos chain.

### Balance check

#### Restake

To check the balance of a given restake address, run:

```console
NODE_ADDRESS=<api_node> \
WALLET_ADDRESS=<address> \
TAG=<tag> \
make cosmos-restake-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<api_node>`|The API node address (including protocol, e.g.: https://cosmos-api.validat0.rs).|
|`<address>`|The restake address to get the balance of.|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
NODE_ADDRESS=https://cosmos-api.validat0.rs \
WALLET_ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
TAG=cosmoshub-restake-balance \
make cosmos-restake-balance-check
```

#### Sommelier

To check the sommelier orchestrator balance, run:

```console
NODE_ADDRESS=<api_node> \
WALLET_ADDRESS=<address> \
TAG=<tag> \
make cosmos-sommelier-orchestrator-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<api_node>`|The API node address (including protocol, e.g.: https://cosmos-api.validat0.rs).|
|`<address>`|The sommelier orchestrator address to get the balance of.|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
NODE_ADDRESS=https://cosmos-api.validat0.rs \
WALLET_ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
TAG=cosmoshub-restake-balance \
make cosmos-sommelier-orchestrator-balance-check
```

### Block Latency

To check the block latency, run:

```console
RPC_STATUS_URL=<rpc_status_url> \
make cosmos-block-latency
```

where:

|Param|Description|
|-----|-----------|
|`<rpc_status_url>`|The RPC status URL (e.g.: `http://localhost:26657/status`) |

e.g.:

```console
RPC_STATUS_URL=http://localhost:26657/status \
make cosmos-block-latency
```

### Peers

To check the number of peers, run:

```console
RPC_NET_INFO_URL=<rpc_net_info_url> \
make cosmos-peers
```

where:

|Param|Description|
|-----|-----------|
|`<rpc_net_info_url>`|The RPC net info URL (e.g.: `http://localhost:26657/net_info`) |

e.g.:

```console
RPC_NET_INFO_URL=http://localhost:26657/net_info \
make cosmos-peers
```

## THORChain

THORChain specific scripts.

### Bond

To check the bond of a node, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-bond
```

where:

|Param|Description|
|-----|-----------|
|`<node_address>`|The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`)|
|`<node_name>`|A friendly name to identify the node in DataDog (e.g.: `thorchain01`)|

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-bond
```

### Slash Points

To check the slash points a node is incurring, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-slash-points
```

where:

|Param|Description|
|-----|-----------|
|`<node_address>`|The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`)|
|`<node_name>`|A friendly name to identify the node in DataDog (e.g.: `thorchain01`)|

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-slash-points
```

### Status

To check the status of a node, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-status
```

where:

|Param|Description|
|-----|-----------|
|`<node_address>`|The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`)|
|`<node_name>`|A friendly name to identify the node in DataDog (e.g.: `thorchain01`)|

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-status
```
