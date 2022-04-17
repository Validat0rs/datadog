# Monitoring

Monitoring solutions for application-specific blockchains built with the Cosmos SDK.

## Setup

### DataDog

There's two specific things that we use DataDog for:

1. General monitoring (CPU/Memory/HDD) of an environment (VPS/Kubernetes/Bare Metal).
2. For pushing metrics and then using that data to construct a set of monitors from which we can trigger alarms, if needbe.

For setting up DataDog, please see [here](datadog/README.md).

## Chains

### THORChain

For THORChain-specific monitoring, please see [here](THORCHAIN.md).

### General Purpose

For general purpose monitoring, please see [here](GENERAL.md).
