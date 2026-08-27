terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.105.0"
    }
  }
  backend "azurerm" {
    storage_account_name = "vanyas627storageforinfra"
    resource_group_name  = "mate-azure-task-12"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
