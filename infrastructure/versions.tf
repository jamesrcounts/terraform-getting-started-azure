terraform {
  required_version = "~> 1.3.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }

  cloud {
    organization = "olive-mercury"
    workspaces {
      tags = ["terraform", "pipelines"]
    }
  }
}