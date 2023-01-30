# THORChain

THORChain specific scripts.

## Bond

To check the bond of a node, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-bond
```

where:

| Param            | Description                                                                        |
|------------------|------------------------------------------------------------------------------------|
| `<node_address>` | The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`) |
| `<node_name>`    | A friendly name to identify the node in DataDog (e.g.: `thorchain01`)              |

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-bond
```

## Slash Points

To check the slash points a node is incurring, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-slash-points
```

where:

| Param            | Description                                                                        |
|------------------|------------------------------------------------------------------------------------|
| `<node_address>` | The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`) |
| `<node_name>`    | A friendly name to identify the node in DataDog (e.g.: `thorchain01`)              |

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-slash-points
```

## Status

To check the status of a node, run:

```console
NODE_ADDRESS=<node_address> \
NODE_NAME=<node_name> \
make cosmos-thorchain-thornode-status
```

where:

| Param            | Description                                                                        |
|------------------|------------------------------------------------------------------------------------|
| `<node_address>` | The bond address of the node (e.g.: `thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z`) |
| `<node_name>`    | A friendly name to identify the node in DataDog (e.g.: `thorchain01`)              |

e.g.:

```console
NODE_ADDRESS=thor19ph9mawujd73gvep82pk09pmmsdl35983mk73z \
NODE_NAME=thorchain01 \
make cosmos-thorchain-thornode-status
```
