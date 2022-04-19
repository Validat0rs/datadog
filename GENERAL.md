# General

General-purpose scripts.

## Block Latency

Monitoring the block latency of a node informs us if a node has possibly locked up or disconnected from the network.

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

## Peers

Monitoring the number of peers is helps to determine if a node has potential reachability issues.

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
