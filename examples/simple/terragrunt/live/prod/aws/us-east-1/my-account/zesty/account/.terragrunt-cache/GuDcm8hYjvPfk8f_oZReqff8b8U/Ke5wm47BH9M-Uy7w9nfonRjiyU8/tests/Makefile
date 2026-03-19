SHELL := /bin/bash

SIMPLE_TF       := ../examples/simple/terraform
MC_ACCOUNT_TF   := ../examples/multi_clusters/terraform/account
MC_PROD_TF      := ../examples/multi_clusters/terraform/kompass-eks-prod
MC_STAGING_TF   := ../examples/multi_clusters/terraform/kompass-eks-staging
MC_DATA_TF      := ../examples/multi_clusters/terraform/kompass-eks-data

SIMPLE_TG_ZESTY := ../examples/simple/terragrunt/live/prod/aws/us-east-1/my-account/zesty
MC_TG_ZESTY     := ../examples/multi_clusters/terragrunt/live/prod/aws/us-east-1/my-account/zesty

.PHONY: validate validate-simple validate-mc-account validate-mc-prod validate-mc-staging validate-mc-data

validate: validate-simple validate-mc-account validate-mc-prod validate-mc-staging validate-mc-data
	@echo "All examples validated successfully."

validate-simple:
	@echo "-- validate: simple/terraform --"
	cd $(SIMPLE_TF) && terraform init -backend=false && terraform validate

validate-mc-account:
	@echo "-- validate: multi_clusters/terraform/account --"
	cd $(MC_ACCOUNT_TF) && terraform init -backend=false && terraform validate

validate-mc-prod:
	@echo "-- validate: multi_clusters/terraform/kompass-eks-prod --"
	cd $(MC_PROD_TF) && terraform init -backend=false && terraform validate

validate-mc-staging:
	@echo "-- validate: multi_clusters/terraform/kompass-eks-staging --"
	cd $(MC_STAGING_TF) && terraform init -backend=false && terraform validate

validate-mc-data:
	@echo "-- validate: multi_clusters/terraform/kompass-eks-data --"
	cd $(MC_DATA_TF) && terraform init -backend=false && terraform validate

.PHONY: test-tf test-tf-simple test-tf-mc-account test-tf-mc-prod test-tf-mc-staging test-tf-mc-data

test-tf: test-tf-simple test-tf-mc-account test-tf-mc-prod test-tf-mc-staging test-tf-mc-data
	@echo "All terraform tests passed."

test-tf-simple:
	@echo "-- terraform test: simple/terraform --"
	cd $(SIMPLE_TF) && terraform test

test-tf-mc-account:
	@echo "-- terraform test: multi_clusters/terraform/account --"
	cd $(MC_ACCOUNT_TF) && terraform test

test-tf-mc-prod:
	@echo "-- terraform test: multi_clusters/terraform/kompass-eks-prod --"
	cd $(MC_PROD_TF) && terraform test

test-tf-mc-staging:
	@echo "-- terraform test: multi_clusters/terraform/kompass-eks-staging --"
	cd $(MC_STAGING_TF) && terraform test

test-tf-mc-data:
	@echo "-- terraform test: multi_clusters/terraform/kompass-eks-data --"
	cd $(MC_DATA_TF) && terraform test

.PHONY: validate-tg validate-tg-simple validate-tg-mc

validate-tg: validate-tg-simple validate-tg-mc
	@echo "All Terragrunt examples validated successfully."

validate-tg-simple:
	@echo "-- terragrunt validate: simple/terragrunt --"
	cd $(SIMPLE_TG_ZESTY) && terragrunt run-all validate

validate-tg-mc:
	@echo "-- terragrunt validate: multi_clusters/terragrunt --"
	cd $(MC_TG_ZESTY) && terragrunt run-all validate
