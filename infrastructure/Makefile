default: all

backend_instance_id := harmless-humpback
env_subscription_id := 77fc5cff-a120-47a1-83bc-5c64163f872d
env_instance_id     := neat-deer

fmt:
	terraform fmt -recursive

init: azurerm.backend.tfvars
	terraform init --upgrade -backend-config azurerm.backend.tfvars
	terraform -v
	terraform providers
	
clean: config
	terraform destroy -auto-approve
	
validate:
	terraform validate

azurerm.backend.tfvars:
	az keyvault secret download \
		--name azurerm-backend-tfvars \
		--vault-name kv-$(backend_instance_id) \
		--file azurerm.backend.tfvars

terraform.auto.tfvars:
	# TODO: this could also be loaded from keyvault
	@echo 'resource_group_name="rg-$(env_instance_id)"'   > terraform.auto.tfvars
	@echo 'env_subscription_id="$(env_subscription_id)"' >> terraform.auto.tfvars

plan: terraform.auto.tfvars fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	az login --use-device-code
	az account set --subscription "Jim Counts (personal)"
	az account show --output table