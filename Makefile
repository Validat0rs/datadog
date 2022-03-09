helm-datadog-deploy:
	@./scripts/helm/datadog/deploy.sh -a $(API_KEY)

provider-aws-configure:
	@./scripts/provider/aws/configure.sh -a $(AWS_ACCESS_KEY_ID) -s $(AWS_SECRET_ACCESS_KEY) -r $(AWS_REGION) -p $(AWS_PROFILE)

provider-aws-kubeconfig:
	@./scripts/provider/aws/kubeconfig.sh -c $(CLUSTER_NAME) -r $(AWS_REGION) -p $(AWS_PROFILE)

thorchain-thornode-publish-slash-points:
	@./scripts/thorchain/thornode/publish_slash_points.sh -a $(ADDRESS) -t $(TAG)

thorchain-thornode-publish-bond:
	@./scripts/thorchain/thornode/publish_bond.sh -a $(ADDRESS) -t $(TAG)
