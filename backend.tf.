terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "alina18storageaccount18"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}