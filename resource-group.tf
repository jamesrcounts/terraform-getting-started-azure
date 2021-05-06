# Create a new resource group
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"

  tags = {
    environment = "demo"
  }
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}