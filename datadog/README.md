# DataDog

All commands should be run from the root of the repository.

## EKS

### Prerequisites

- [helm](https://helm.sh/docs/intro/install)
- [kubectl](https://kubernetes.io/docs/tasks/tools)
- [awscli](https://docs.aws.amazon.com/cli/index.html)

It's assumed that you have some basic AWS knowledge. Setup of the CLI and your keys is out of scope of this README.

### Setup

1. Ensure you've switched to your cluster:

```console
CLUSTER_NAME=<cluster_name> \
AWS_REGION=<aws_region> \
AWS_PROFILE=<aws_profile> \
make provider-aws-kubeconfig
```

where:

|Param|Description|
|-----|-----------|
|`<cluster_name>`|The name of your EKS cluster.|
|`<aws_region>`|The AWS region where your cluster is deployed to.|
|`<aws_profile>`|The name of the AWS profile.|

e.g.:

```console
CLUSTER_NAME=my-cluster \
AWS_REGION=us-east-1 \
AWS_PROFILE=my-profile \
make provider-aws-kubeconfig
```

2. Generate a new [API key](https://app.datadoghq.com/account/settings#api) from within your DataDog account.

3. Deploy the helm chart:

```console
API_KEY=<API_KEY> make helm-datadog-deploy
```
e.g.:

```console
API_KEY=b55gweGZj9LWxXG5 make helm-datadog-deploy
```

4. You should then be able to see the chart deployed, by running:

```console
kubectl get pods -n monitoring
```

## Standalone

### Setup

1. Generate a new [API key](https://app.datadoghq.com/account/settings#api) from within your DataDog account. Add the key to your `/etc/environment` file, as follows:

```console
DD_API_KEY=<api_key>
```

where:

|Param|Description|
|-----|-----------|
|`<api_key>`|Your API key you just generated.|

e.g.:

```console
DD_API_KEY=b55gweGZj9LWxXG5
```

2. Install the agent:

```console
DD_AGENT_MAJOR_VERSION=7 \
DD_API_KEY=<api_key> \
DD_SITE="datadoghq.com" \
bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
```

where:

|Param|Description|
|-----|-----------|
|`<api_key>`|Your API key generated in the previous step.|

e.g.:

```console
DD_AGENT_MAJOR_VERSION=7 \
DD_API_KEY=b55gweGZj9LWxXG5 \
DD_SITE="datadoghq.com" \
bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"
```

## Monitors

A number of monitors for several chains can be found [here](monitors). These can be imported into DataDog and tweaked accordingly.
