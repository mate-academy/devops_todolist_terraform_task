terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.105.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "mate-azure-task-12"
    storage_account_name  = "storagejghae7"
    container_name        = "task-artifacts"
    key                   = "terraform.tfstate"
  }
}

