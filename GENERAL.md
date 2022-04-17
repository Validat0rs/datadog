# General

General-purpose scripts.

## Prerequisites

These scripts are intended to be used on a non-Kubernetes environment. Please ensure that you're setup DataDog as per the [standalone](datadog/README.md#Standalone) instructions.

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
