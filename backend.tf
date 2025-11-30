# Configuration for the Azure Remote State Backend
# This file defines where Terraform should store its state file (terraform.tfstate)

terraform {
  backend "azurerm" {
    resource_group_name  = "mate-azure-task-12"
    storage_account_name = "yourstorageaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}