terraform {
  required_version = ">= 0.14"
  # backend "azurerm" {  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.57"
    }
  }
}