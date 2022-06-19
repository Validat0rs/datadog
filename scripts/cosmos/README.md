# Cosmos

Cosmos monitoring.

## General

General purpose scripts for any Cosmos chain.

### Balance check

To check the balance of a given address, run:

```console
ADDRESS=<address> \
RPC_NODE=<rpc_node> \
TAG=<tag> \
make cosmos-balance-check
```

where:

|Param|Description|
|-----|-----------|
|`<address>`|The address to get the balance of.|
|`<rpc_node>`|The RPC node address (including protocol, e.g.: https://cosmos-rpc.validat0.rs).|
|`<tag>`|The name of the DataDog tag for this metric.|

e.g.:

```console
ADDRESS=cosmos1sjllsnramtg3ewxqwwrwjxfgc4n4ef9u0tvx7u \
RPC_NODE=https://cosmos-rpc.validat0.rs \
TAG=cosmoshub-restake-balance \
make cosmos-balance-check
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
