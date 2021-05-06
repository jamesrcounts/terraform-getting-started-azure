default: all

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade 
	terraform -v
	terraform providers
	
clean:
	terraform destroy -auto-approve
	
validate:
	terraform validate

plan: fmt validate
	terraform plan -out plan.tfplan -var 'resource_group_name=rg-factual-stinkbug'
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan

login:
	az login
	az account set --subscription "Jim Counts (MSDN)"
	az account show