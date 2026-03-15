terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "yourstorageaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}