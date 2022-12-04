default: plan

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	terraform -v
	terraform providers

validate:
	terraform validate

plan: fmt validate
	terraform plan