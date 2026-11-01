terraform {
  required_version = ">= 1.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.105.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "tfstatestorageacc2026"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}