default: plan

docs:
	terraform-docs markdown document --output-file README.md --output-mode inject .

fmt:
	terraform fmt -recursive

init:
	terraform init --upgrade
	terraform -v
	terraform providers

validate:
	terraform validate

plan: fmt validate docs
	terraform plan