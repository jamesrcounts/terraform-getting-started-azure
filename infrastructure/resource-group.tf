# Read details about the resource group created for this project.
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}