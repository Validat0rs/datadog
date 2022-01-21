# Monitoring

A suite of monitoring tools/scripts/solutions for application-specific blockchains built with the Cosmos SDK.

## Getting Started

#### Prerequisites / Dependencies:

- [helm](https://helm.sh/docs/intro/install)
- [kubectl](https://kubernetes.io/docs/tasks/tools)
- [awscli](https://docs.aws.amazon.com/cli/index.html)

## EKS

It's assumed that you have some basic AWS knowledge. Setup of the CLI and your keys is out of scope of this README.

### DataDog

1. Ensure you've switched to your cluster:

```console
CLUSTER_NAME=<cluster_name> \
AWS_REGION=<aws_region> \
AWS_PROFILE=<aws_profile> \
make provider-aws-kubeconfig
```

Where:

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
