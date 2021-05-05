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
	terraform plan -out plan.tfplan
	
apply:
	terraform apply plan.tfplan
	rm plan.tfplan

all: init plan