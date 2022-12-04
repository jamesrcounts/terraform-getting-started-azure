/**
 * # Terraform: Getting Started with Azure
 *
 * Deploys a simple VM as a basic example of working with Azure in Terraform.
 */

# Common variables shared by multiple resources
locals {
  instance_id = data.azurerm_resource_group.rg.tags["instance_id"]
}
