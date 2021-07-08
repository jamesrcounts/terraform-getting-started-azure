# Getting Started with Terraform and Azure

Originally derived from the tutorial on [learn.hashicorp.com][1], I've updated this example over the years to demonstrate the ways that I work with Terraform (especially in Azure DevOps pipelines).

Read on for instructions on how to use this example.

## Requirements

- Microsoft Azure subscription
- A resource group to deploy this infrastructure into
- Azure CLI
- Terraform 1.0.0 or later

## Deployment

1. Create a resource group in your Azure subscription and make a note of the name. 
    - Example: `rg-getting-started`
1. Clone this repository.
1. Login to your Azure subscription using `az login`.
1. Change directories to `./infrastructure`
1. Run `terraform init`.
1. Run `terraform apply -var='resource_group_name=rg-getting-started`.
    - Note: adjust this command to match the name you used to create the resource group in step 1.
    - When prompted by terraform, review the plan and type `yes` to deploy.

## Clean Up

1. Run `terraform destroy -var='resource_group_name=rg-getting-started`.
    - Note: adjust this command to match the name you used to create the resource group in step 1.
    - When prompted by terraform, review the plan and type `yes` to remove the managed infrastructure.
1. Delete the resource group you created for this example.

## Next Steps

For a more complete walk-through, including examples of using this demo with remote state and pipelines check out these articles:

1. 2021 - [Terraform Pipelines with Azure Devops: Getting Started][3]
1. 2019 - [Safe Terraform Pipelines with Azure DevOps][2]

[1]: https://learn.hashicorp.com/collections/terraform/azure-get-started
[2]: http://jamesrcounts.com/2019/10/14/azdo-safe-terraform-pipelines.html
[3]: http://jamesrcounts.com/2021/07/07/terraform-pipelines-with-azure-devops.html