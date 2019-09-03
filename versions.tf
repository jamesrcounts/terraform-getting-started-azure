terraform {
  required_version = ">= 0.12"
  backend "azurerm" {
    resource_group_name  = "terraformrg"
    storage_account_name = "terraformde3fb0d9c9a7413"
    container_name       = "terraform"
    key                  = "terraform-getting-started.tfstate"
  }
}
