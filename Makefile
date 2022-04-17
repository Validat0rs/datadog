vendor-datadog-helm-deploy:
	@./scripts/vendor/datadog/helm/deploy.sh -a $(API_KEY)

provider-aws-configure:
	@./scripts/provider/aws/configure.sh -a $(AWS_ACCESS_KEY_ID) -s $(AWS_SECRET_ACCESS_KEY) -r $(AWS_REGION) -p $(AWS_PROFILE)

provider-aws-kubeconfig:
	@./scripts/provider/aws/kubeconfig.sh -c $(CLUSTER_NAME) -r $(AWS_REGION) -p $(AWS_PROFILE)

cosmos-thorchain-thornode-bond:
	@./scripts/cosmos/thorchain/thornode/bond.sh -a $(NODE_ADDRESS) -t $(NODE_NAME)

cosmos-thorchain-thornode-slash-points:
	@./scripts/cosmos/thorchain/thornode/slash_points.sh -a $(NODE_ADDRESS) -t $(NODE_NAME)

cosmos-block-latency:
	@./scripts/cosmos/block_latency.sh -r $(RPC_STATUS_URL)
