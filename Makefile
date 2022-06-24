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

cosmos-thorchain-thornode-status:
	@./scripts/cosmos/thorchain/thornode/status.sh -a $(NODE_ADDRESS) -t $(NODE_NAME)

cosmos-balance-check:
	@./scripts/cosmos/balance_check.sh -a $(NODE_ADDRESS) -w $(WALLET_ADDRESS) -t $(TAG)

cosmos-block-latency:
	@./scripts/cosmos/block_latency.sh -r $(RPC_STATUS_URL)

cosmos-peers:
	@./scripts/cosmos/peers.sh -r $(RPC_NET_INFO_URL)

ethereum-balance-check:
	@./scripts/ethereum/balance_check.sh -w $(WALLET_ADDRESS) -t $(TAG)
