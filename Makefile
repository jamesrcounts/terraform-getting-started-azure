default: all

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade 
	terraform -v
	terraform providers
	
clean: config
	terraform destroy -auto-approve
	
validate:
	terraform validate

config:
	@echo 'resource_group_name="rg-factual-stinkbug"' >> terraform.auto.tfvars

plan: config fmt validate
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show