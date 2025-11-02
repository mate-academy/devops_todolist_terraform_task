terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "yourstorageaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}


